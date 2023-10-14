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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *STD_TEXTIO;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *IEEE_P_3564397177;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003744720917_1351276808_init();
    work_m_00000000000696425111_3673085417_init();
    work_m_00000000001643714546_1306279239_init();
    work_m_00000000000079941273_2227945711_init();
    work_m_00000000001643714546_2232003288_init();
    work_m_00000000000779537946_3381898454_init();
    work_m_00000000003100091453_2370168646_init();
    work_m_00000000000662858396_3945777025_init();
    work_m_00000000002600059145_0278921292_init();
    work_m_00000000000089396131_2152786828_init();
    work_m_00000000002458925484_4057675914_init();
    work_m_00000000003766181152_0597495051_init();
    work_m_00000000003852696686_2220136494_init();
    work_m_00000000003277131280_3246726298_init();
    work_m_00000000001537425555_2207681426_init();
    work_m_00000000003065592373_2035480523_init();
    work_m_00000000000824742073_1264885982_init();
    work_m_00000000003510497824_0886308060_init();
    work_m_00000000002925260347_3574786568_init();
    work_m_00000000001992002649_1310296684_init();
    work_m_00000000002438898635_3027548060_init();
    work_m_00000000002914726504_3387524553_init();
    work_m_00000000000163443182_3995722189_init();
    work_m_00000000004134447467_2073120511_init();
    ieee_p_2592010699_init();
    std_textio_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    ieee_p_3564397177_init();
    xilinxcorelib_a_3602424893_2959432447_init();
    xilinxcorelib_a_3541679604_1709443946_init();
    xilinxcorelib_a_3063621410_0543512595_init();
    xilinxcorelib_a_0623880878_3212880686_init();
    work_a_2276998720_1234278282_init();
    xilinxcorelib_a_1965984881_2959432447_init();
    xilinxcorelib_a_4078218114_0543512595_init();
    xilinxcorelib_a_2073278040_3212880686_init();
    work_a_3956796010_2050730183_init();


    xsi_register_tops("work_m_00000000000163443182_3995722189");
    xsi_register_tops("work_m_00000000004134447467_2073120511");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");

    return xsi_run_simulation(argc, argv);

}
