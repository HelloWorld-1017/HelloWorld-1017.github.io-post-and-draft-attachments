概率模型有时既含有观测变量(observed variable)，有时又含有隐变量或潜在变量(latent variable)。如果概率模型的变量都是观测变量，那么给定数据，可以直接用极大似然估计法或贝叶斯估计法估计模型参数，比如在博客==XX==中提到的单高斯模型(GSM)，直接用样本均值和样本协方差矩阵对高斯模型进行点估计。但是，当模型含有隐变量时，就不能简单地使用这些估计方法。EM算法就是含有隐变量的极大似然估计法或者极大后验概率估计法。这里仅讨论极大似然估计法的EM算法，



假设有三枚硬币，分别记作A，B，C。这些硬币正面出现的概率分别是$\pi$，$p$和$q$。进行如下的抛硬币试验：先抛硬币A，根据结果选出硬币B或者硬币C，正面选择硬币B，反面选择硬币C；然后抛选出的硬币，根据此时抛硬币的结果，出现正面记作1，出现反面记作0。进行n次独立重复试验，比如进行10次，观测结果如下：
$$
1,1,0,1,0,0,1,0,1,1\label{data}
$$
**假设我们只能观测到抛硬币的结果，而不能观测抛硬币的过程**。问如何根据==XXX==，估计三硬币出现正面的概率，即三硬币模型的参数？

记随机变量$y$为观测变量，表示一次试验的结果为1或0；随机变量$z$为隐变量，表示未观测到的抛硬币的结果，$\theta=(\pi,p,q)$为模型参数，则根据全概率公式有：

> **完备时间群**
>
> 设$B_1,B_2,\cdots,B_n$为有限个或无限个事件，它们两两互斥且在每次试验中至少发生一个，即：
> $$
> B_iB_j=\emptyset,\ (i\ne j)\ (不可能事件)\\
> B_1+B_2+\cdots+B_n=\Omega,\ (必然事件)\notag
> $$
> 则把满足上述性质的的一组事件称为一个完备事件群。
>
> **全概率公式**
>
> 对于任一事件$A$，若$B_1,B_2,\cdots,B_n$为完备事件群，则有：
> $$
> \begin{split}
> P(A)&=P(AB)=P(AB_1+AB_2+\cdots+AB_n)\\
> &=P(AB_1)+P(AB_2)+\cdots+P(AB_n)\\
> &=P(AB_1\vert B_1)P(B_1)+P(A\vert B_2)P(B_2)+\cdots+P(A\vert B_n)P(B_n)
> \end{split}\notag
> $$

$$
\begin{split}
P(y\vert\theta)&=P(yz\vert\theta)=\sum_z P(z\vert\theta)P(y\vert z,\theta)\\
&=\pi p(1-p)^{1-y}+(1-\pi)q^y(1-q)^{1-y}
\end{split}\label{eq1}
$$

式$\eqref{eq1}$称为数据$\eqref{data}$的sheng'cehng
