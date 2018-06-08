/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Files built by Me/Computer Organization Lab/Lab7_2.0/div.v";
static unsigned int ng1[] = {99999U, 0U};
static unsigned int ng2[] = {1U, 0U};
static int ng3[] = {0, 0};
static unsigned int ng4[] = {100000000U, 0U};
static unsigned int ng5[] = {0U, 0U};
static unsigned int ng6[] = {14U, 0U};
static unsigned int ng7[] = {13U, 0U};
static unsigned int ng8[] = {11U, 0U};
static unsigned int ng9[] = {7U, 0U};



static void Always_29_0(char *t0)
{
    char t8[8];
    char t22[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t23;

LAB0:    t1 = (t0 + 2848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 3912);
    *((int *)t2) = 1;
    t3 = (t0 + 2880);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(30, ng0);

LAB5:    xsi_set_current_line(31, ng0);
    t4 = (t0 + 1768);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng1)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB7;

LAB6:    t10 = (t7 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB7;

LAB10:    if (*((unsigned int *)t6) < *((unsigned int *)t7))
        goto LAB8;

LAB9:    t12 = (t8 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (~(t13));
    t15 = *((unsigned int *)t8);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(34, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 17, 0LL);

LAB13:    goto LAB2;

LAB7:    t11 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB9;

LAB8:    *((unsigned int *)t8) = 1;
    goto LAB9;

LAB11:    xsi_set_current_line(32, ng0);
    t18 = (t0 + 1768);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = ((char*)((ng2)));
    memset(t22, 0, 8);
    xsi_vlog_unsigned_add(t22, 17, t20, 17, t21, 17);
    t23 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t23, t22, 0, 0, 17, 0LL);
    goto LAB13;

}

static void Always_37_1(char *t0)
{
    char t8[8];
    char t22[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t23;

LAB0:    t1 = (t0 + 3096U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 3928);
    *((int *)t2) = 1;
    t3 = (t0 + 3128);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(38, ng0);

LAB5:    xsi_set_current_line(39, ng0);
    t4 = (t0 + 1928);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng4)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB7;

LAB6:    t10 = (t7 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB7;

LAB10:    if (*((unsigned int *)t6) < *((unsigned int *)t7))
        goto LAB8;

LAB9:    t12 = (t8 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (~(t13));
    t15 = *((unsigned int *)t8);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(42, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 29, 0LL);

LAB13:    goto LAB2;

LAB7:    t11 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB9;

LAB8:    *((unsigned int *)t8) = 1;
    goto LAB9;

LAB11:    xsi_set_current_line(40, ng0);
    t18 = (t0 + 1928);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = ((char*)((ng2)));
    memset(t22, 0, 8);
    xsi_vlog_unsigned_add(t22, 29, t20, 29, t21, 29);
    t23 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t23, t22, 0, 0, 29, 0LL);
    goto LAB13;

}

static void Always_45_2(char *t0)
{
    char t7[8];
    char t23[8];
    char t39[8];
    char t47[8];
    char t87[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    char *t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    int t71;
    int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    char *t85;
    char *t86;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    char *t101;
    char *t102;

LAB0:    t1 = (t0 + 3344U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 3944);
    *((int *)t2) = 1;
    t3 = (t0 + 3376);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(46, ng0);

LAB5:    xsi_set_current_line(47, ng0);
    t4 = (t0 + 1608);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t7, 0, 8);
    t8 = (t6 + 4);
    t9 = *((unsigned int *)t8);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB6;

LAB7:    if (*((unsigned int *)t8) != 0)
        goto LAB8;

LAB9:    t15 = (t7 + 4);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t15);
    t18 = (t16 || t17);
    if (t18 > 0)
        goto LAB10;

LAB11:    memcpy(t47, t7, 8);

LAB12:    t79 = (t47 + 4);
    t80 = *((unsigned int *)t79);
    t81 = (~(t80));
    t82 = *((unsigned int *)t47);
    t83 = (t82 & t81);
    t84 = (t83 != 0);
    if (t84 > 0)
        goto LAB24;

LAB25:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t7, 0, 8);
    t5 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = (~(t9));
    t11 = *((unsigned int *)t4);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB30;

LAB28:    if (*((unsigned int *)t5) == 0)
        goto LAB27;

LAB29:    t6 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t6) = 1;

LAB30:    t8 = (t7 + 4);
    t14 = (t4 + 4);
    t16 = *((unsigned int *)t4);
    t17 = (~(t16));
    *((unsigned int *)t7) = t17;
    *((unsigned int *)t8) = 0;
    if (*((unsigned int *)t14) != 0)
        goto LAB32;

LAB31:    t29 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t29 & 1U);
    t30 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t30 & 1U);
    memset(t23, 0, 8);
    t15 = (t7 + 4);
    t31 = *((unsigned int *)t15);
    t32 = (~(t31));
    t33 = *((unsigned int *)t7);
    t34 = (t33 & t32);
    t35 = (t34 & 1U);
    if (t35 != 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t15) != 0)
        goto LAB35;

LAB36:    t20 = (t23 + 4);
    t36 = *((unsigned int *)t23);
    t37 = *((unsigned int *)t20);
    t41 = (t36 || t37);
    if (t41 > 0)
        goto LAB37;

LAB38:    memcpy(t87, t23, 8);

LAB39:    t86 = (t87 + 4);
    t96 = *((unsigned int *)t86);
    t97 = (~(t96));
    t98 = *((unsigned int *)t87);
    t99 = (t98 & t97);
    t100 = (t99 != 0);
    if (t100 > 0)
        goto LAB51;

LAB52:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);

LAB53:
LAB26:    goto LAB2;

LAB6:    *((unsigned int *)t7) = 1;
    goto LAB9;

LAB8:    t14 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB9;

LAB10:    t19 = (t0 + 1928);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = ((char*)((ng4)));
    memset(t23, 0, 8);
    t24 = (t21 + 4);
    t25 = (t22 + 4);
    t26 = *((unsigned int *)t21);
    t27 = *((unsigned int *)t22);
    t28 = (t26 ^ t27);
    t29 = *((unsigned int *)t24);
    t30 = *((unsigned int *)t25);
    t31 = (t29 ^ t30);
    t32 = (t28 | t31);
    t33 = *((unsigned int *)t24);
    t34 = *((unsigned int *)t25);
    t35 = (t33 | t34);
    t36 = (~(t35));
    t37 = (t32 & t36);
    if (t37 != 0)
        goto LAB16;

LAB13:    if (t35 != 0)
        goto LAB15;

LAB14:    *((unsigned int *)t23) = 1;

LAB16:    memset(t39, 0, 8);
    t40 = (t23 + 4);
    t41 = *((unsigned int *)t40);
    t42 = (~(t41));
    t43 = *((unsigned int *)t23);
    t44 = (t43 & t42);
    t45 = (t44 & 1U);
    if (t45 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t40) != 0)
        goto LAB19;

LAB20:    t48 = *((unsigned int *)t7);
    t49 = *((unsigned int *)t39);
    t50 = (t48 & t49);
    *((unsigned int *)t47) = t50;
    t51 = (t7 + 4);
    t52 = (t39 + 4);
    t53 = (t47 + 4);
    t54 = *((unsigned int *)t51);
    t55 = *((unsigned int *)t52);
    t56 = (t54 | t55);
    *((unsigned int *)t53) = t56;
    t57 = *((unsigned int *)t53);
    t58 = (t57 != 0);
    if (t58 == 1)
        goto LAB21;

LAB22:
LAB23:    goto LAB12;

LAB15:    t38 = (t23 + 4);
    *((unsigned int *)t23) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB16;

LAB17:    *((unsigned int *)t39) = 1;
    goto LAB20;

LAB19:    t46 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t46) = 1;
    goto LAB20;

LAB21:    t59 = *((unsigned int *)t47);
    t60 = *((unsigned int *)t53);
    *((unsigned int *)t47) = (t59 | t60);
    t61 = (t7 + 4);
    t62 = (t39 + 4);
    t63 = *((unsigned int *)t7);
    t64 = (~(t63));
    t65 = *((unsigned int *)t61);
    t66 = (~(t65));
    t67 = *((unsigned int *)t39);
    t68 = (~(t67));
    t69 = *((unsigned int *)t62);
    t70 = (~(t69));
    t71 = (t64 & t66);
    t72 = (t68 & t70);
    t73 = (~(t71));
    t74 = (~(t72));
    t75 = *((unsigned int *)t53);
    *((unsigned int *)t53) = (t75 & t73);
    t76 = *((unsigned int *)t53);
    *((unsigned int *)t53) = (t76 & t74);
    t77 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t77 & t73);
    t78 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t78 & t74);
    goto LAB23;

LAB24:    xsi_set_current_line(48, ng0);
    t85 = ((char*)((ng5)));
    t86 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t86, t85, 0, 0, 1, 0LL);
    goto LAB26;

LAB27:    *((unsigned int *)t7) = 1;
    goto LAB30;

LAB32:    t18 = *((unsigned int *)t7);
    t26 = *((unsigned int *)t14);
    *((unsigned int *)t7) = (t18 | t26);
    t27 = *((unsigned int *)t8);
    t28 = *((unsigned int *)t14);
    *((unsigned int *)t8) = (t27 | t28);
    goto LAB31;

LAB33:    *((unsigned int *)t23) = 1;
    goto LAB36;

LAB35:    t19 = (t23 + 4);
    *((unsigned int *)t23) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB36;

LAB37:    t21 = (t0 + 1928);
    t22 = (t21 + 56U);
    t24 = *((char **)t22);
    t25 = ((char*)((ng4)));
    memset(t39, 0, 8);
    t38 = (t24 + 4);
    t40 = (t25 + 4);
    t42 = *((unsigned int *)t24);
    t43 = *((unsigned int *)t25);
    t44 = (t42 ^ t43);
    t45 = *((unsigned int *)t38);
    t48 = *((unsigned int *)t40);
    t49 = (t45 ^ t48);
    t50 = (t44 | t49);
    t54 = *((unsigned int *)t38);
    t55 = *((unsigned int *)t40);
    t56 = (t54 | t55);
    t57 = (~(t56));
    t58 = (t50 & t57);
    if (t58 != 0)
        goto LAB43;

LAB40:    if (t56 != 0)
        goto LAB42;

LAB41:    *((unsigned int *)t39) = 1;

LAB43:    memset(t47, 0, 8);
    t51 = (t39 + 4);
    t59 = *((unsigned int *)t51);
    t60 = (~(t59));
    t63 = *((unsigned int *)t39);
    t64 = (t63 & t60);
    t65 = (t64 & 1U);
    if (t65 != 0)
        goto LAB44;

LAB45:    if (*((unsigned int *)t51) != 0)
        goto LAB46;

LAB47:    t66 = *((unsigned int *)t23);
    t67 = *((unsigned int *)t47);
    t68 = (t66 & t67);
    *((unsigned int *)t87) = t68;
    t53 = (t23 + 4);
    t61 = (t47 + 4);
    t62 = (t87 + 4);
    t69 = *((unsigned int *)t53);
    t70 = *((unsigned int *)t61);
    t73 = (t69 | t70);
    *((unsigned int *)t62) = t73;
    t74 = *((unsigned int *)t62);
    t75 = (t74 != 0);
    if (t75 == 1)
        goto LAB48;

LAB49:
LAB50:    goto LAB39;

LAB42:    t46 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t46) = 1;
    goto LAB43;

LAB44:    *((unsigned int *)t47) = 1;
    goto LAB47;

LAB46:    t52 = (t47 + 4);
    *((unsigned int *)t47) = 1;
    *((unsigned int *)t52) = 1;
    goto LAB47;

LAB48:    t76 = *((unsigned int *)t87);
    t77 = *((unsigned int *)t62);
    *((unsigned int *)t87) = (t76 | t77);
    t79 = (t23 + 4);
    t85 = (t47 + 4);
    t78 = *((unsigned int *)t23);
    t80 = (~(t78));
    t81 = *((unsigned int *)t79);
    t82 = (~(t81));
    t83 = *((unsigned int *)t47);
    t84 = (~(t83));
    t88 = *((unsigned int *)t85);
    t89 = (~(t88));
    t71 = (t80 & t82);
    t72 = (t84 & t89);
    t90 = (~(t71));
    t91 = (~(t72));
    t92 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t92 & t90);
    t93 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t93 & t91);
    t94 = *((unsigned int *)t87);
    *((unsigned int *)t87) = (t94 & t90);
    t95 = *((unsigned int *)t87);
    *((unsigned int *)t87) = (t95 & t91);
    goto LAB50;

LAB51:    xsi_set_current_line(50, ng0);
    t101 = ((char*)((ng2)));
    t102 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t102, t101, 0, 0, 1, 0LL);
    goto LAB53;

}

static void Always_55_3(char *t0)
{
    char t8[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    int t34;
    char *t35;
    char *t36;

LAB0:    t1 = (t0 + 3592U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 3960);
    *((int *)t2) = 1;
    t3 = (t0 + 3624);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(56, ng0);

LAB5:    xsi_set_current_line(57, ng0);
    t4 = (t0 + 1768);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng1)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB9;

LAB6:    if (t20 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t8) = 1;

LAB9:    t24 = (t8 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t8);
    t28 = (t27 & t26);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1448);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1448);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 4, 0LL);

LAB12:    goto LAB2;

LAB8:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(58, ng0);

LAB13:    xsi_set_current_line(59, ng0);
    t30 = (t0 + 1448);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);

LAB14:    t33 = ((char*)((ng6)));
    t34 = xsi_vlog_unsigned_case_compare(t32, 4, t33, 4);
    if (t34 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng7)));
    t34 = xsi_vlog_unsigned_case_compare(t32, 4, t2, 4);
    if (t34 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng8)));
    t34 = xsi_vlog_unsigned_case_compare(t32, 4, t2, 4);
    if (t34 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng9)));
    t34 = xsi_vlog_unsigned_case_compare(t32, 4, t2, 4);
    if (t34 == 1)
        goto LAB21;

LAB22:
LAB24:
LAB23:    xsi_set_current_line(64, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1448);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB25:    goto LAB12;

LAB15:    xsi_set_current_line(60, ng0);
    t35 = ((char*)((ng7)));
    t36 = (t0 + 1448);
    xsi_vlogvar_wait_assign_value(t36, t35, 0, 0, 4, 0LL);
    goto LAB25;

LAB17:    xsi_set_current_line(61, ng0);
    t3 = ((char*)((ng8)));
    t4 = (t0 + 1448);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 4, 0LL);
    goto LAB25;

LAB19:    xsi_set_current_line(62, ng0);
    t3 = ((char*)((ng9)));
    t4 = (t0 + 1448);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 4, 0LL);
    goto LAB25;

LAB21:    xsi_set_current_line(63, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 1448);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 4, 0LL);
    goto LAB25;

}


extern void work_m_00000000004292823821_1086445890_init()
{
	static char *pe[] = {(void *)Always_29_0,(void *)Always_37_1,(void *)Always_45_2,(void *)Always_55_3};
	xsi_register_didat("work_m_00000000004292823821_1086445890", "isim/testbench_isim_beh.exe.sim/work/m_00000000004292823821_1086445890.didat");
	xsi_register_executes(pe);
}
