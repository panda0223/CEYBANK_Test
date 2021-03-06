package RoomStatus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Branches.Branch;

import RoomTypeMaster.Room_type;
import block_Register.block;
import connections.DBConnection;


public class RoomStatusDAO {

	public static String getBranchIDbyLoging(String branchID) {

		String status = "";

		Branch r = new Branch();

		try {
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT B_display_name FROM branches where id=?;");

			ps.setString(1, branchID);
			//System.out.println("******************************branchID : " + branchID);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {

				r.setDisplayName(rs.getString(1));

				status = rs.getString(1);
				//System.out.println("******************************branch name : " + rs.getString(1));

			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	// ---------------------------
   
    	 public static List<StatusRooms> getRoomDetails(String blockID) {
    		
    		 //System.out.println("blockID: "+blockID);
		List<StatusRooms> list = new ArrayList<StatusRooms>();  
		
		try {
			 Connection con = DBConnection.getConnection();  
	            PreparedStatement ps=con.prepareStatement("SELECT * FROM rooms where blockID=?;"); 
	            ps.setString(1, blockID);
	            ResultSet rs=ps.executeQuery();  
	          
	            while(rs.next()){  
	            	StatusRooms e=new StatusRooms(); 
			
	            //	 System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
	            	 e.setId(rs.getString(1));
	            	 e.setRoomBranch(rs.getString(2));
	            	e.setBlockID(rs.getString(3));
	            	e.setRoomNo(rs.getString(4));
	            	e.setRoomName(rs.getString(5));
	            	e.setRoomType(rs.getString(6));
	            	e.setStatus(rs.getString(7));
	            	
	            	 //System.out.println("--------------------------------------------------------------");
//	            	 System.out.println("111111111111111 id : "+ e.getId());
//	            	 System.out.println("111111111111111 RoomNo : "+ e.getRoomNo());
//	            	 System.out.println("11111111111111111 RoomName : "+ e.getRoomName());
//	            	 System.out.println("11111111111111111111 RoomType : "+ e.getRoomType());
//	            	 System.out.println("111111111111111111111 BlockID : "+ e.getBlockID());
	            	// System.out.println("11111111111111111111 Status : "+ e.getStatus());
//	            	 }
	            	 
//	            	 if(rs.getString(6).equals("Available")) {
//	            		 e.setStatus("Available");
//	            		 System.out.println("11111111111111111111 Status : "+ e.getStatus());
//	            	 }
//	            	 else if(rs.getString(6).equals("Cleaning")) {
//	            		 e.setStatus("Cleaning");
//	            		 System.out.println("11111111111111111111 Status : "+ e.getStatus());
//	            	 }
//	            	 else if(rs.getString(6).equals("Occupied")) {
//	            		 e.setStatus("Occupied");
//	            		 System.out.println("11111111111111111111 Status : "+ e.getStatus());
//	            	 }
//	            	 else if(rs.getString(6).equals("Reserved")) {
//	            		 e.setStatus("Reserved");
//	            		 System.out.println("11111111111111111111 Status : "+ e.getStatus());
//	            	 }
//	            
//	            	 else if (rs.getString(6).equals("Maintenance")) {
//	            		 e.setStatus("Maintenance");
//	            		 System.out.println("11111111111111111111 Status : "+ e.getStatus());
//	            	 }
	            	 
	            	 
	            	 
	                 list.add(e);  
	             }  
	             con.close();  
	         }catch(Exception e){e.printStackTrace();}  
	           
	         
	         return list;  
	     }
    	 
    	 
    	 

    	 public static String getBlockNAmeByID(String blockID) {

 			String status = "";

 			block r = new block();

 			try {
 				Connection con = DBConnection.getConnection();

 				PreparedStatement ps = con.prepareStatement("SELECT block_name FROM block where blockID=?;");

 				ps.setString(1, blockID);
 			//	System.out.println("******************************branchID : " + blockID);
 				ResultSet rs = ps.executeQuery();
 				if (rs.next()) {

 					
 r.setBlock_name(rs.getString(1));
 					status = rs.getString(1);
 				//	System.out.println("****************************** name : " + rs.getString(1));

 				}
 				con.close();
 			} catch (Exception ex) {
 				ex.printStackTrace();
 			}

 			return status;
 		}
 	 
 	 
 	 
 	 
 	 public static String getRoomNAmeByID(String roomTypeID) {

 			String status = "";

 			Room_type r = new Room_type();

 			try {
 				Connection con = DBConnection.getConnection();

 				PreparedStatement ps = con.prepareStatement("SELECT RoomTypeName FROM roomtypes where roomTypeId=?;");

 				ps.setString(1, roomTypeID);
 			//	System.out.println("******************************branchID : " + blockID);
 				ResultSet rs = ps.executeQuery();
 				if (rs.next()) {

 					r.setRoom_Type(rs.getString(1));
 					status = rs.getString(1);
 				//	System.out.println("****************************** name : " + rs.getString(1));

 				}
 				con.close();
 			} catch (Exception ex) {
 				ex.printStackTrace();
 			}

 			return status;
 		}
 	 
    	 
    	 
}