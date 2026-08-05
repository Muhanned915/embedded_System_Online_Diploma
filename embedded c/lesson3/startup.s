/* Learn-in-depth
   ENG.Muhanned Ahmed
*/


/*sram 0x20000000
    flash 0x08000000
 */


.section .vectors


.word   0x20001000                              // stack top
.word   _reset
.word   vector_handler
.word   vector_handler
.word   vector_handler
.word   vector_handler
.word   vector_handler
.word   vector_handler
.word   vector_handler
.word   vector_handler
.word   vector_handler
.word   vector_handler
.word   vector_handler
.word   vector_handler
.word   vector_handler
.word   vector_handler
.word   vector_handler
.word   vector_handler
.word   vector_handler
.word   vector_handler




.section .text

_reset:
    bl main
    b .


.thumb_func
vector_handler:
    bl _reset
