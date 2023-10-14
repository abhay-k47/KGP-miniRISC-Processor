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



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002458925484_4057675914_init();
    work_m_00000000003766181152_0597495051_init();
    work_m_00000000003852696686_2220136494_init();
    work_m_00000000003277131280_3246726298_init();
    work_m_00000000001131704377_2161609925_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001131704377_2161609925");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
