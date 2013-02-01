package com.mdxlibrary.interfaces
{
	public interface IMDXAxis
	{
		//---------------------------
		// Getters and Setters
		//---------------------------
		/**
		 * TODO:Documentar
		 */
		function get type():Number;
		function set type(value:Number):void;
		
		/**
		 * Indicate if the axis has any value.
		 */
		function get isEmpty():Boolean;
		
		/**
		 * TODO:Documentar
		 */
		function get length():int;
		
		//---------------------------
		// Public methods
		//---------------------------
		/**
		 * TODO:Documentar
		 */
		function add(value:IAxisDataItem):void;
		
		/**
		 * TODO:Documentar
		 */
		function addAt(value:IAxisDataItem, pos:Number):void;
		
		/**
		 * Changes a AxisItem on one arbitrary position.
		 * 
		 * @param value				A new IAxisDataItem object that you want to add.
		 * @param pos				The position that you want to add this value
		 */
		function changeAt(value:IAxisDataItem, pos:Number):void; 
		
		/**
		 * TODO:Documentar
		 */
		function getItemAt(pos:Number):IAxisDataItem;
		
		/**
		 * TODO:Documentar
		 */
		function remAt(pos:Number):void;
		
		/**
		 * TODO:Documentar
		 */
		function clear():void;
		
		/**
		 * TODO:Documentar
		 */
		function generate():String;
	}
}