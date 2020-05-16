
import 'dart:io';

String readFile(String name)=>File('my_file/$name').readAsStringSync();