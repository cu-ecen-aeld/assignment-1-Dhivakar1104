#include "unity.h"
#include <stdbool.h>
#include <stdlib.h>
#include "../../examples/autotest-validate/autotest-validate.h"
#include "../../assignment-autotest/test/assignment1/username-from-conf-file.h"

/**
* This function should:
*   1) Call the my_username() function in autotest-validate.c to get your hard coded username.
*   2) Obtain the value returned from function malloc_username_from_conf_file() in username-from-conf-file.h within
*       the assignment autotest submodule at assignment-autotest/test/assignment1/
*   3) Use unity assertion TEST_ASSERT_EQUAL_STRING_MESSAGE to verify the two strings are equal.  See
*       the [unity assertion reference](https://github.com/ThrowTheSwitch/Unity/blob/master/docs/UnityAssertionsReference.md)
*/
void test_validate_my_username()
{
   /* 1) Get hard-coded username */
    const char *username_from_function = my_username();

    /* 2) Get username from config file (malloc'ed) */
    char *username_from_conf = malloc_username_from_conf_file();

    /* Sanity check (good practice, optional but safe) */
    TEST_ASSERT_NOT_NULL_MESSAGE(username_from_function,
                                 "my_username() returned NULL");
    TEST_ASSERT_NOT_NULL_MESSAGE(username_from_conf,
                                 "malloc_username_from_conf_file() returned NULL");

    /* 3) Compare strings */
    TEST_ASSERT_EQUAL_STRING_MESSAGE(
        username_from_function,
        username_from_conf,
        "Username from conf file does not match my_username()"
    );

    /* Free allocated memory */
    free(username_from_conf);
}
