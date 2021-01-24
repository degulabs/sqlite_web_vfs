# sqlite_web_vfs
SQLite3 extension for read-only HTTP(S) database access

```
cmake -DCMAKE_BUILD_TYPE=Release -B build . && cmake --build build -j8
env -C build ctest -V
```

![CI](https://github.com/mlin/sqlite_web_vfs/workflows/CI/badge.svg?branch=main)
