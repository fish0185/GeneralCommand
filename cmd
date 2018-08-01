path=%path%;C:\Python   // add Python to environment variables 
echo %PATH% // list of enviroment variables

start . // Open Explorer in the current Windows command line directory


copy NUL .gitignore // create file-.gitignore on current directory

https://stackoverflow.com/questions/11746079/filter-in-tasklist-exe-does-not-take-wildcards
tasklist /v | find "UniqueIdentifier"   // find running task by window title
