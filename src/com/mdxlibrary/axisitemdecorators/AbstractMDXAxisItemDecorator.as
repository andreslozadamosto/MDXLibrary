package com.mdxlibrary.axisitemdecorators
{
	import com.mdxlibrary.interfaces.IMDXAxisItem;
	
	public class AbstractMDXAxisItemDecorator implements IMDXAxisItem
	{
		//--------------------
		// Variables
		//--------------------
		private var _axisItem:IMDXAxisItem;
		
		//--------------------
		// Constructor
		//--------------------
		/**
		 * Constructor
		 */
		public function AbstractMDXAxisItemDecorator(axisItem:IMDXAxisItem)
		{
			this._axisItem = axisItem;
		}
		
		//--------------------
		// Getters and setters
		//--------------------
		/**
		 * @inheritDoc
		 */
		public function get isSetOfMembers():Boolean
		{
			return this._axisItem.isSetOfMembers;
		}
		
		/**
		 * @inheritDoc
		 */
		public function set isSetOfMembers(value:Boolean):void
		{
			this._axisItem.isSetOfMembers = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get addMemberRef():Boolean
		{
			return this._axisItem.addMemberRef;
		}
		
		/**
		 * @inheritDoc
		 */
		public function set addMemberRef(value:Boolean):void
		{
			this._axisItem.addMemberRef = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get length():int
		{
			return this._axisItem.length;
		}
		
		//--------------------
		// Public methods
		//--------------------
		/**
		 * @inheritDoc
		 */
		public function hasMembers():Boolean
		{
			return this._axisItem.hasMembers();;
		}
		
		/**
		 * @inheritDoc
		 */
		public function addMember(value:String):void
		{
			this._axisItem.addMember(value);
		}
		
		/**
		 * @inheritDoc
		 */
		public function addMemberAt(value:String, pos:Number):void
		{
			this._axisItem.addMemberAt(value, pos);
		}
		
		/**
		 * @inheritDoc
		 */
		public function getMemberAt(pos:Number):String
		{
			return this._axisItem.getMemberAt(pos);
		}
		
		/**
		 * @inheritDoc
		 */
		public function remMemberAt(pos:Number):void
		{
			this._axisItem.remMemberAt(pos);
		}
		
		/**
		 * @inheritDoc
		 */
		public function clear():void
		{
			this._axisItem.clear();
		}
		
		/**
		 * @inheritDoc
		 */
		public function generate():String
		{
			return this._axisItem.generate();
		}
	}
}