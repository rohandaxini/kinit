#include <ruby.h>

/* our new native method; it just returns
 * the string "Hello Kiprosh" */
/*
static VALUE hello_kiprosh(VALUE self) {
  return rb_str_new2("Hello Kiprosh");
}
*/

/* ruby calls this to load the extension */
void Init_kinit(void) {

  printf("hello Kiprosh\n");	

}