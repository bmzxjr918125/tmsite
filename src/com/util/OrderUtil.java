package com.util;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;
import java.util.Random;

import org.apache.log4j.Logger;

public class OrderUtil {

	protected static final Logger log = Logger.getLogger(OrderUtil.class);
	/**
	 * 生成订单号
	 * @param linlincount 邻邻账号
	 * @param mili 当前时间毫秒数
	 * @return
	 */
	public static String createOrderNumber(String linlincount,long mili){
		//log.info(new Date() + "开始生成订单号");
		int account = Integer.parseInt(linlincount);
		Random random = new Random();
		String orderNumber = random.nextInt(account)+""+mili;
		//log.info(new Date() + "生成订单号：" + orderNumber);
		return orderNumber;
	}

	/**
     * 提供精确的乘法运算。
     * @param value1 被乘数
     * @param value2 乘数
     * @return 两个参数的积
     */
	public static Double mul(Number value1, Number value2) {
        BigDecimal b1 = new BigDecimal(Double.toString(value1.doubleValue()));
        BigDecimal b2 = new BigDecimal(Double.toString(value2.doubleValue()));
        return b1.multiply(b2).doubleValue();
    }

	 /**
     * 提供（相对）精确的除法运算，当发生除不尽的情况时， 精确到小数点以后10位，以后的数字四舍五入。
     * @param dividend 被除数
     * @param divisor 除数
     * @return 两个参数的商
     */
    public static Double div(Double dividend, Double divisor) {
        return div(dividend, divisor,8);
    }

    /**
     * 提供（相对）精确的除法运算。 当发生除不尽的情况时，由scale参数指定精度，以后的数字四舍五入。
     *
     * @param dividend 被除数
     * @param divisor 除数
     * @param scale 表示表示需要精确到小数点以后几位。
     * @return 两个参数的商
     */
    public static Double div(Double dividend, Double divisor, Integer scale) {
        if (scale < 0) {
            throw new IllegalArgumentException(
                    "The scale must be a positive integer or zero");
        }
        BigDecimal b1 = new BigDecimal(Double.toString(dividend));
        BigDecimal b2 = new BigDecimal(Double.toString(divisor));
        return b1.divide(b2, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * 提供精确的加法运算。
     * @param value1 被加数
     * @param value2 加数
     * @return 两个参数的和
     */
    public static Double add(Number value1, Number value2) {
        BigDecimal b1 = new BigDecimal(Double.toString(value1.doubleValue()));
        BigDecimal b2 = new BigDecimal(Double.toString(value2.doubleValue()));
        return b1.add(b2).doubleValue();
    }

    /**
     * 提供精确的减法运算。
     * @param value1 被减数
     * @param value2 减数
     * @return 两个参数的差
     */
    public static double sub(Number value1, Number value2) {
        BigDecimal b1 = new BigDecimal(Double.toString(value1.doubleValue()));
        BigDecimal b2 = new BigDecimal(Double.toString(value2.doubleValue()));
        return b1.subtract(b2).doubleValue();
    }

    /**
     * 进行四舍五入操作
     * @param price 价格
     * @param len 长度
     * @return
     */
    public static double round(double price,int len) {
        BigDecimal b1 = new BigDecimal(price);
        BigDecimal b2 = new BigDecimal(1);
        // 任何一个数字除以1都是原数字
        // ROUND_HALF_UP是BigDecimal的一个常量，表示进行四舍五入的操作
        return b1.divide(b2,len,BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    /**
     * 显示价格 默认精确两位
     * len=0时显示￥
     * @return
     */
    public static String showPrice(double price,int len){
    	NumberFormat currency = NumberFormat.getCurrencyInstance(Locale.CHINA);
		return currency.format(price).substring(len);
    }

    /**
     * 显示价格 自定义精确位数
     * minFractionDigits 最小精确位数
     * minFractionDigits 最大精确位数
     * len 0带￥ 1不带￥
     * @return
     */
    public static String showPriceByFD(double price,int len,int minFractionDigits,int maxFractionDigits){
    	NumberFormat currency = NumberFormat.getCurrencyInstance(Locale.CHINA);
    	currency.setMaximumFractionDigits(maxFractionDigits);
    	currency.setMinimumFractionDigits(minFractionDigits);
    	return currency.format(price).substring(len);
    }
    
    /**
     * 六位随机数
     * @return
     */
    public static int randomNum(){
    	Random random = new Random();
		int num = random.nextInt(899999);
		num = num + 100000;
		return num;
    }

}
