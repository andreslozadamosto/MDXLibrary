package com.mdxlibrary
{
	import com.mdxlibrary.interfaces.IMDXAxis;

	public class MDXQuery
	{
		//---------------------------
		// Variables
		//---------------------------
		private var _axisList:Vector.<IMDXAxis>;
		private var _cubeName:String;
		
		//---------------------------
		// Constructor
		//---------------------------
		/**
		 * Constructor
		 */
		public function MDXQuery()
		{
			this._axisList = new Vector.<IMDXAxis>();
		}
		
		//---------------------------
		// Getters and Setters
		//---------------------------
		/**
		 * @inheritDoc
		 */
		public function get cubeName():String {
			return this._cubeName;
		}
		public function set cubeName(value:String):void {
			this._cubeName = value;
		}
		
		//---------------------------
		// Public methods
		//---------------------------
		/**
		 * @inheritDoc
		 */
		public function addAxis(value:IMDXAxis):void {
			if ( value != null ) {
				var cant:int = this._axisList.length;
				var i:int = 0;
				for ( ; i < cant; i++ ) {
					if ( value.type == this._axisList[i].type ) {
						break; //it will be only one per axis type
					}
				}
				this._axisList[i] = value;
			}
		} 
		
		/**
		 * @inheritDoc
		 */
		public function generate():String {
			var returnValue:String = "";
			if ( this._axisList.length > 0 ) {
				var i:int = 0;
				var cont:int = this._axisList.length;
				for ( ; i < cont ; i++ ) {
					returnValue += "\t" + this._axisList[i].generate() +",\n";
				}
				returnValue = "SELECT\n" + returnValue + "FROM " + this.cubeName;
			}
			
			return returnValue;
		}
	}
}