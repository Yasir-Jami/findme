# findme - File-Finding Utility

`findme` is a C-based command-line utility which searches for files and directories on Unix-based systems. It can currently filter by file type, name, owner, and directory depth.

* Recursively searches directories starting from a given path
* Filters search results by:
  * File type (`-type`)
  * File name (`-name`)
  * File owner (`-user`)
  * Maximum search depth (`-maxdepth`)

To compile, simply run: 

```bash
make
```

---

## Usage

```bash
findme [directory] [options]
```

### Example

```bash
findme /home/user -type f -name "report.txt" -user alice -maxdepth 3
```

Searches in `/home/user` for regular files named `report.txt` owned by user `alice`, no more than 3 directory levels deep.

---
## Options

| Option      | Description                                                                                                          |
| ----------- | -------------------------------------------------------------------------------------------------------------------- |
| `-type`     | File type: <br>`f` - regular file<br>`d` - directory<br>`s` - socket<br>`c` - character device<br>`b` - block device |
| `-name`     | Exact filename to search for                                                                                         |
| `-user`     | Username of the file owner                                                                                           |
| `-maxdepth` | Maximum directory depth to search                                                                                    |

---

## Project Structure

```
findme/
├── main.c         // Entry point and argument parsing
├── findme.c       // Core logic for directory traversal and filtering
├── findme.h       // Header file with function prototypes and macros
└── README.md      // Documentation
```

---

## Notes

* This utility must be run with appropriate permissions to access the directories and files in question.
* Default behavior:
  * All file types are considered if `-type` is not specified
  * Filename is not filtered unless `-name` is used
  * Owner is ignored unless `-user` is used
  * Search depth defaults to 255
