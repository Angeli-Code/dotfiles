#!/usr/bin/env python3

"""
    Script that allows me to compile a file into Assembly code. The file must be passed in as an argument. This
works in tandum with neovim allowing for the current neovim file to be converted. View my autocommands to see more.

"""

import os
import shutil
import subprocess
import tempfile
import sys


def main():
    filename, javafx_flag = parse_arguments()
    file_extension = get_file_extension(filename)
    project_type = determine_project_type(file_extension, javafx_flag)
    temp_dir = create_temp_dir()

    # Copy all Java files to the temporary directory
    if file_extension == ".java":
        copy_all_java_files(temp_dir)

    compiler, run_command = get_compiler_and_commands(file_extension, project_type)
    compilation_result = compile_code(compiler, filename, temp_dir, project_type)

    if compilation_result["success"]:
        handle_successful_compilation(run_command, temp_dir, project_type, filename)
    else:
        handle_compilation_error(compilation_result, temp_dir)


def parse_arguments():
    if len(sys.argv) < 2:
        print("Usage: darkcompiler <mainfilename.extension> [--javafx]")
        sys.exit(1)
    filename = sys.argv[1]
    javafx_flag = "--javafx" in sys.argv
    return filename, javafx_flag


def get_file_extension(filename):
    return os.path.splitext(filename)[1]


def determine_project_type(file_extension, javafx_flag):
    if file_extension == ".java":
        return "javafx" if javafx_flag else "java"
    elif file_extension == ".cpp":
        return "cpp"
    elif file_extension == ".c":
        return "c"
    elif file_extension == ".asm":
        return "assembly"
    else:
        print(f"Unsupported file extension: {file_extension}")
        sys.exit(1)


def create_temp_dir():
    return tempfile.mkdtemp(dir=os.getcwd())


def copy_all_java_files(temp_dir):
    for file in os.listdir():
        if file.endswith(".java"):
            shutil.copy(file, temp_dir)


def get_compiler_and_commands(file_extension, project_type):
    if project_type == "java":
        return "javac", "java"
    elif project_type == "javafx":
        return (
            "javac",
            "java --module-path /path/to/javafx-sdk/lib --add-modules javafx.controls,javafx.fxml",
        )
    elif project_type == "cpp":
        return "g++", "./a.out"
    elif project_type == "c":
        return "gcc", "./a.out"
    elif project_type == "assembly":
        return "nasm", "./a.out"
    else:
        raise ValueError(f"Unsupported project type: {project_type}")


def compile_code(compiler, filename, temp_dir, project_type):
    try:
        if project_type in ["java", "javafx"]:
            result = subprocess.run(
                [compiler, filename], cwd=temp_dir, capture_output=True, text=True
            )
        elif project_type in ["cpp", "c"]:
            result = subprocess.run(
                [compiler, filename, "-o", os.path.join(temp_dir, "a.out")],
                cwd=temp_dir,
                capture_output=True,
                text=True,
            )
        elif project_type == "assembly":
            obj_file = os.path.join(temp_dir, "output.o")
            exe_file = os.path.join(temp_dir, "a.out")
            subprocess.run(
                [compiler, "-felf64", filename, "-o", obj_file],
                cwd=temp_dir,
                capture_output=True,
                text=True,
            )
            result = subprocess.run(
                ["ld", "-o", exe_file, obj_file],
                cwd=temp_dir,
                capture_output=True,
                text=True,
            )

        if result.returncode == 0:
            return {"success": True}
        else:
            return {"success": False, "errors": result.stderr}
    except Exception as e:
        return {"success": False, "errors": str(e)}


def handle_compilation_error(compilation_result, temp_dir):
    print("Compilation failed with errors:")
    print(compilation_result["errors"])

    save_error_log = input("Do you want to save the error log to error.txt? (y/n): ")
    if save_error_log.lower() == "y":
        with open(os.path.join(temp_dir, "error.txt"), "w") as error_file:
            error_file.write(compilation_result["errors"])
        shutil.copy(os.path.join(temp_dir, "error.txt"), os.getcwd())

    cleanup_temp_dir(temp_dir)


def handle_successful_compilation(run_command, temp_dir, project_type, filename):
    print("Compilation successful.")
    run_program = input("Do you want to run the program? (y/n): ")
    if run_program.lower() == "y":
        try:
            if project_type in ["java", "javafx"]:
                # Extract class name from filename
                class_name = os.path.splitext(os.path.basename(filename))[0]
                if project_type == "javafx":
                    run_command = run_command.split() + [class_name]
                else:
                    run_command = [run_command, class_name]

            show_return_value = input("Do you want to see the return value? (y/n): ")
            result = subprocess.run(
                run_command, cwd=temp_dir, capture_output=True, text=True
            )
            if result.returncode != 0:
                print(f"Runtime errors: {result.stderr}")
            if show_return_value.lower() == "y":
                print(f"Program exited with return value: {result.returncode}")
        except Exception as e:
            print(f"Error running the program: {e}")
    cleanup_temp_dir(temp_dir)


def cleanup_temp_dir(temp_dir):
    keep_temp = input("Do you want to keep the temporary directory? (y/n): ")
    if keep_temp.lower() == "n":
        shutil.rmtree(temp_dir)
    else:
        print(f"Temporary files kept in: {temp_dir}")


if __name__ == "__main__":
    main()
