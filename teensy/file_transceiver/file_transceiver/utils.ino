void my_assert(bool cond, int line, const char* file, const char* message, bool fatal)
{
  if(!cond)
  {
    if(fatal)
    {
      while(true)
      {
        Serial.printf("Assertion Failed in file %s, line %d: %s\n", file, line, message);
        delay(10000);
      }
    }
    else
    {
      Serial.printf("Assertion Failed in file %s, line %d: %s\n", file, line, message);
    }
  }
}

char temp_make_string_buffer[1024];
const char* make_string(const char* format, ...)
{
    va_list arguments;
    va_start(arguments, format);
    vsnprintf(temp_make_string_buffer, sizeof(temp_make_string_buffer), format, arguments);
    va_end(arguments);
    return temp_make_string_buffer;
}

String getCommand()
{
  String command = "";
  command = Serial.readString(1024);
  return command.trim();
}

int getValue()
{
  String cmd = getCommand();
  return cmd.toInt();
}