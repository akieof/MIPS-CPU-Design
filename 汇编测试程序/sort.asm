 .text
#################################################################################
#������ʵ�֣��ֽڵ�ַ0x200���ֵ�ַ0x80����ʼ��8���ֵ�Ԫ�Ľ�������,�˳������mars mips������������,����ʱ�뽫Mars Setting�е�Memory Configuration����ΪCompact��data at address 0
#
#################################################################################
 .text
sort_init:
 addi $s0,$0,-1     #s0=-1
 addi $s1,$0,0      #s1=0
 sw $s0,512($s1)  #[0x200]=-1
 addi $s0,$s0,1    #s0=0
 addi $s1,$s1,4    #s1=4
 sw $s0,512($s1) #[0x204]=0
 addi $s0,$s0,1   #s0=1
 addi $s1,$s1,4   #s1=8
 sw $s0,512($s1) #[0x208]=1
 addi $s0,$s0,1   #s0=2
 addi $s1,$s1,4   #s1=12
 sw $s0,512($s1) #[0x212]=2
 addi $s0,$s0,1
 addi $s1,$s1,4
 sw $s0,512($s1)
 addi $s0,$s0,1
 addi $s1,$s1,4
 sw $s0,512($s1)
 addi $s0,$s0,1
 addi $s1,$s1,4
 sw $s0,512($s1)
 addi $s0,$s0,1
 addi $s1,$s1,4
 sw $s0,512($s1)
#0x200��ʼ��ʼ��8������������-1(0x200),0(0x204),1(0x208),2(0x212),3(0x216),4(0x220),5(0x224),6(0x228)

 add $s0,$zero,$zero   #s0=0
 addi $s1,$zero,28   #��������s0=28=4*7
sort_loop:
 lw $s3,512($s0)    # s3=-1
 lw $s4,512($s1)   #s4=6
 slt $t0,$s3,$s4     #s3<s4  t0=1
 beq $t0,$0,sort_next   #��������
 sw $s3, 512($s1) #���ݽ���
 sw $s4, 512($s0)   
sort_next:
 addi $s1, $s1, -4   #s1=s1-4
 bne $s0, $s1, sort_loop  #s1==s0 ð������ ��ѭ��
 
 addi $s0,$s0,4
 addi $s1,$zero,28
 bne $s0, $s1, sort_loop #ð������ ��ѭ��
 addi   $v0,$zero,10         # system call for exit
 syscall                  # we are out of here.   
