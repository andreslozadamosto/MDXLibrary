package com.mdxlibrary.interfaces
{
	public interface IMDXQuery
	{
		//---------------------------
		// Getters and Setters
		//---------------------------
		/**
		 * TODO: Documentar
		 */
		function get cubeName():String;
		function set cubeName(value:String):void;
		
		//---------------------------
		// Methods
		//---------------------------
		/**
		 * TODO: Documentar
		 */
		function addAxis(value:IMDXAxis):void;

		/**
		 * TODO: Documentar
		 */
		function generate():String;
	}
}