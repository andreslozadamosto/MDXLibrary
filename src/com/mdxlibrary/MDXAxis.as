package com.mdxlibrary
{
	import com.mdxlibrary.interfaces.IAxisDataItem;
	import com.mdxlibrary.interfaces.IMDXAxis;
	
	public class MDXAxis implements IMDXAxis
	{
		//---------------------------
		// Constants
		//---------------------------
		/**
		 * Row Axis.
		 */
		static public const ROW_AXIS:int = 0;
		/**
		 * Column Axis.
		 */
		static public const COLUMN_AXIS:int = 1;
		/**
		 * SLICER Axis.
		 */
		static public const SLICER_AXIS:int = 5;
		
		//---------------------------
		// Variables
		//---------------------------
		private var _axis:Vector.<IAxisDataItem>;
		private var _type:Number;
		
		//---------------------------
		// Constructor
		//---------------------------
		/**
		 * Constructor
		 */
		public function MDXAxis()
		{
			this._axis = new Vector.<IAxisDataItem>();
		}
		
		//---------------------------
		// Getters and Setters
		//---------------------------
		/**
		 * @inheritDoc
		 */
		public function get type():Number {
			return this._type;
		}
		public function set type(value:Number):void {
			this._type = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get isEmpty():Boolean {
			return (this._axis == null || this._axis.length == 0)?true:false;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get length():int {
			return this._axis.length;
		}
		//---------------------------
		// Public methods
		//---------------------------
		/**
		 * @inheritDoc
		 */
		public function add(value:IAxisDataItem):void
		{
			if ( value != null ) {
				this._axis.push(value);
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function addAt(value:IAxisDataItem, pos:Number):void
		{
			if ( value == null || isNaN(pos) || pos > this._axis.length || pos < 0) {
				return;
			}
			var vec:Vector.<IAxisDataItem> = this._axis.slice(0, pos);
			vec.push(value);
			vec = vec.concat(this._axis.slice(pos));
			this._axis = vec;
		}
		
		/**
		 * @inheritDoc
		 */
		public function changeAt(value:IAxisDataItem, pos:Number):void {
			if ( value == null || isNaN(pos) || pos >= this._axis.length || pos < 0 ) {
				return;
			}
			this._axis[pos] = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function remAt(pos:Number):void {
			if ( isNaN(pos) || pos >= this._axis.length || pos < 0) {
				return;
			}
			var vec:Vector.<IAxisDataItem> = this._axis.slice(0, pos);
			vec = vec.concat(this._axis.slice(pos+1));
			this._axis = vec;
		}
		
		/**
		 * @inheritDoc
		 */
		public function getItemAt(pos:Number):IAxisDataItem {
			if ( isNaN(pos) || pos >= this._axis.length || pos < 0 ) {
				return null;
			}
			return this._axis[pos];
		}
		
		/**
		 * @inheritDoc
		 */
		public function clear():void {
			this._axis = null;
			this._axis = new Vector.<IAxisDataItem>();
		}
		
		/**
		 * @inheritDoc
		 */
		public function generate():String
		{
			var returnValue:String = "";
			
			if ( this._axis.length == 0 ) {
				return returnValue;
			}
			else if ( this._axis.length == 1 ) {
				returnValue = this._axis[0].generate();
			}
			else {
				var vec:Vector.<IAxisDataItem> = this._axis.reverse();
				var i:int = 1;
				var cant:int = vec.length;
				returnValue = vec[0].generate();
				for ( ; i < cant; i++ ) {
					vec[i].add(returnValue);
					returnValue = vec[i].generate();
				}
			}
			returnValue += " ON " + getAxisName();
			
			return returnValue;
		}
		
		//---------------------------
		// Protected methods
		//---------------------------
		/**
		 * TODO:Documentar
		 */
		protected function getAxisName():String {
			switch (this.type) {
				case ROW_AXIS:
					return "ROWS";
					break;
				case COLUMN_AXIS:
					return "COLUMNS";
					break;
				case SLICER_AXIS:
					return "SLICER";
					break;
			}
			
			return isNaN(this.type)?"NaN":this.type.toString();
		}
	}
}