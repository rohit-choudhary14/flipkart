<%-- 
    Document   : product_image_upload_Process
    Created on : 18 Apr, 2022, 9:35:50 AM
    Author     : rohit
--%>

<%@page contentType="text/html"  import="java.sql.*,java.io.*,java.util.zip.*,org.json.simple.JSONObject,org.json.simple.JSONArray"pageEncoding="UTF-8"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
  

     JSONArray List = new JSONArray(); 
     JSONObject obj= new JSONObject();  
     String contentType = request.getContentType();
     String code="";
     String sn="";
     String imageSave = "";
     byte dataBytes[] = null;
     String saveFile = null;
     
    
         code=request.getParameter("pc");
         sn=request.getParameter("sn");
         code=code+"_"+sn;
     
    
     if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
        DataInputStream in = new DataInputStream(request.getInputStream());
        int formDataLength = request.getContentLength();
        dataBytes = new byte[formDataLength];
        int byteRead = 0;
        int totalBytesRead = 0;
        while (totalBytesRead < formDataLength) {
            byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
            totalBytesRead += byteRead;
            
        }

        String file = new String(dataBytes);

        saveFile =code+".jpg"; 

        int lastIndex = contentType.lastIndexOf("=");
        String boundary = contentType.substring(lastIndex + 1, contentType.length());

        int pos;
        pos = file.indexOf("filename=\"");
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        pos = file.indexOf("\n", pos) + 1;
        int boundaryLocation = file.indexOf(boundary, pos) - 4;
        int startPos = ((file.substring(0, pos)).getBytes()).length;
        int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
      
          try{
              File f=new File("C:/Users/rohit/Documents/NetBeansProjects/e-commerce/build/web/product_photos/"+saveFile);
          
            FileOutputStream fileOut = new FileOutputStream(f);

            // fileOut.write(dataBytes);
            fileOut.write(dataBytes, startPos, (endPos - startPos));
            fileOut.flush();
            fileOut.close();
            //obj.put("success","success");
            List.add(obj);
            out.print(formDataLength);
            out.println(List.toJSONString()); 
            imageSave = "Success";
          }
          catch(Exception e){}
 
       
    }
%>

