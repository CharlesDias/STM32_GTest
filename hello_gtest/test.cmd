:: run tests
@echo off

for %%a in (%*) do (
    call set "%%~1=%%~2"
    shift
)

cd build/test

IF NOT "%--suite%"=="" (
    ctest -R %--suite% --verbose
) ELSE (
    ctest --verbose
)