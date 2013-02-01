package com.mdxlibrary.interfaces {

	public interface IMDXAxisItem {
		
		//------------------------------
		// Getters and setters
		//------------------------------
		/**
		 * Tell us if the member is a list or all members.
		 * If is TRUE is a list.
		 * If is FALSe is all members.
		 */
		function get isSetOfMembers():Boolean;
		function set isSetOfMembers(value:Boolean):void;
		
		/**
		 * TODO: documentar
		 */
		function get addMemberRef():Boolean;
		function set addMemberRef(value:Boolean):void;
		
		/**
		 * TODO: documentar
		 */
		function get length():int;
		//------------------------------
		// methods
		//------------------------------
		/**
		 * Tell as if the axis has members setted.
		 */
		function hasMembers():Boolean;
		
		/**
		 * Add new member into axis.
		 * @param value				The name of member.
		 */
		function addMember(value:String):void;
		
		/**
		 * TODO: documentar
		 */
		function addMemberAt(value:String, pos:Number):void;
		
		/**
		 * TODO: documentar
		 */
		function getMemberAt(pos:Number):String;
		
		/**
		 * TODO: documentar
		 */
		function remMemberAt(pos:Number):void;
		
		/**
		 * TODO: documentar
		 */
		function clear():void;
		
		/**
		 * Generate a axis string for MDX Query.
		 */ 
		function generate():String;
	}
}