package com.util;



import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.ConvolveOp;
import java.awt.image.Kernel;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class ImageCompressUtil {

    /**
     * 描述： 格式统一压缩为jpg
     *
     * @param path 需要压缩的图片路径
     * @param fileName 要压缩的图片名称
     * @param toFileName 压缩后的图片名称
     * @param scale 压缩比例 不能大于1,默认0.5-该项已无效化，只改变大小，不改变宽高
     * @param quality 压缩品质介于0.1~1.0之间
     * @param width 压缩后的图片的宽度
     * @param height 压缩后的图片的高度 返回值：void 图片宽度如果大于450则等比例缩放为450
     *            
     */
   public static void imageCompress(String path, String fileName,
            String toFileName, float scale, float quality, int width, int height) {
        try { // 原图路径 原图名称 目标路径 压缩比率0.5 0.75 原图宽度 原图高度
           // long start = System.currentTimeMillis();
            File imageFile=new File(path + fileName);
            Image image = javax.imageio.ImageIO.read(imageFile);
            int imageWidth = image.getWidth(null);
            int imageHeight = image.getHeight(null);
            if (scale > 0.5)
                scale = 0.5f;// 默认压缩比为0.5，压缩比越大，对内存要去越高，可能导致内存溢出
            // 按比例计算出来的压缩比
            float realscale =(450.0f/(imageWidth+0.0f)); //getRatio(imageWidth, imageHeight, width, height);
            float finalScale =realscale;//Math.min(scale, realscale);// 取压缩比最小的进行压缩
           /* float finalScale = 1f;*/
            imageWidth = (int) (finalScale * imageWidth);
            imageHeight = (int) (finalScale * imageHeight);
            //imageWidth = (int) (600);
            // imageHeight = (int) (500);

            image = image.getScaledInstance(imageWidth, imageHeight,
                    Image.SCALE_AREA_AVERAGING);
            // Make a BufferedImage from the Image.
            BufferedImage mBufferedImage = new BufferedImage(imageWidth,
                    imageHeight, BufferedImage.TYPE_INT_RGB);
            Graphics2D g2 = mBufferedImage.createGraphics();

            g2.drawImage(image, 0, 0, imageWidth, imageHeight, Color.white,
                    null);
            g2.dispose();

            float[] kernelData2 = { -0.125f, -0.125f, -0.125f, -0.125f, 2,
                    -0.125f, -0.125f, -0.125f, -0.125f };
            Kernel kernel = new Kernel(3, 3, kernelData2);
            ConvolveOp cOp = new ConvolveOp(kernel, ConvolveOp.EDGE_NO_OP, null);
            mBufferedImage = cOp.filter(mBufferedImage, null);

            FileOutputStream out = new FileOutputStream(path + toFileName);
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
            JPEGEncodeParam param = encoder
                    .getDefaultJPEGEncodeParam(mBufferedImage);
            param.setQuality(quality, true);// 默认0.75
            encoder.setJPEGEncodeParam(param);
            encoder.encode(mBufferedImage);
            
            //删除原文件
           /* if (imageFile.exists())
            	imageFile.delete();*/
            
            out.close();
           // long end = System.currentTimeMillis();
           // System.out.println("图片：" + fileName + "，压缩时间：" + (end - start)
           //         + "ms");
        } catch (FileNotFoundException fnf) {
        } catch (IOException ioe) {
            //System.out.println("IOException");
            ioe.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {

        }
    }

    public static void imageCompress(String path, String fileName,
            String toFileName, float scale, int width, int height) {
        imageCompress(path, fileName, toFileName, scale, 0.75f, width, height);
    }

    @SuppressWarnings("unused")
	private static float getRatio(int width, int height, int maxWidth,
            int maxHeight) {// 获得压缩比率的方法
        float Ratio = 1.0f;
        float widthRatio;
        float heightRatio;
        widthRatio = (float) maxWidth / width;
        heightRatio = (float) maxHeight / height;
        if (widthRatio < 1.0 || heightRatio < 1.0) {
            Ratio = widthRatio <= heightRatio ? widthRatio : heightRatio;
        }
        return Ratio;
    }

    public static byte[] convertImage2Type(String imageFile, String imageType)
            throws Exception {// 图片格式转换
        File inputFile = new File(imageFile);
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        BufferedImage input = ImageIO.read(inputFile);
        
        ImageIO.write(input, imageType, output);
        return output.toByteArray();
    }
    /**
     * 图片格式转换为jpg
     * 
     * @param imageFile 原图完全路径
     * @param imageName 原图名称
     * @return  图片名称
     * @throws Exception
     */
    public static String convertImage2TypeJPG(String imageFile,String imageName)
            throws Exception {// 图片格式转换
        File inputFile = new File(imageFile);
        int suffixIndex = imageFile.lastIndexOf(".");
        String suffix = imageFile.substring(suffixIndex + 1);
        if (!"jpg".equals(suffix)) {// 如果原图片的不是PNG格式的图片
            String fileName = imageFile.substring(0, suffixIndex + 1) + "jpg";
            File output = new File(fileName);
            BufferedImage input = ImageIO.read(inputFile);
            
            /*********************************/
            BufferedImage tagImg = new BufferedImage(input.getWidth(), input.getHeight(), BufferedImage.TYPE_INT_RGB);
            Graphics g = tagImg.getGraphics();
            g.drawImage(input, 0, 0, null);
            g.dispose();
            ImageIO.write(tagImg,"jpg", output);
            /*********************************/
            //ImageIO.write(input,"jpg", output);
            /*********************************/
            // 转换后删除原文件
            if (inputFile.exists())
                inputFile.delete();
           
        }
        	
        	 return imageName.substring(0, imageName.lastIndexOf(".") + 1) + "jpg";
       
       
        
    }

    public static void main(String[] args){
    	try {
    		 /**
    	     * 描述：
    	     *
    	     * @param path
    	     *            需要压缩的图片路径
    	     * @param fileName
    	     *            要压缩的图片名称
    	     * @param toFileName
    	     *            压缩后的图片名称
    	     * @param scale
    	     *            压缩比例 不能大于1,默认0.5
    	     * @param quality
    	     *            压缩品质介于0.1~1.0之间
    	     * @param width
    	     *            压缩后的图片的宽度
    	     * @param height
    	     *            压缩后的图片的高度 返回值：void
    	     */
    		String name=convertImage2TypeJPG("C:\\Users\\Administrator\\Desktop\\125161113_31n.png","dddd.jpg");
    		System.out.println(name);
    		//imageCompress("C:/Users/Administrator/Desktop/testCompress/","dddd.jpg","dddd.jpg",(float)0.5,(float)0.9,600,500);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    }
    
    
}