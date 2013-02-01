package com.mdxlibrary {
	import com.mdxlibrary.interfaces.IMDXAxisItem;

	public class MDXAxisItem implements IMDXAxisItem {
		//----------------------------
		//
		// Variables
		//
		//----------------------------
		private var _addMemberRef:Boolean = true;
		private var _refMemberText:String = ".Members";
		private var _listMembers:Vector.<String>;
		private var _isSetOfMembers:Boolean = false;
		
		//----------------------------
		//
		// Constructor
		//
		//----------------------------
		/**
		 * Constructor.
		 */
		public function MDXAxisItem() {
			this._listMembers = new Vector.<String>();
		}
		
		//----------------------------
		//
		// Getters and Settters
		//
		//----------------------------
		/**
		 * @inheritDoc
		 */
		public function get isSetOfMembers():Boolean{
			return this._isSetOfMembers;
		}
		public function set isSetOfMembers(value:Boolean):void{
			this._isSetOfMembers = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get addMemberRef():Boolean {
			return this._addMemberRef;
		}
		public function set addMemberRef(value:Boolean):void {
			this._addMemberRef = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get length():int {
			return this._listMembers.length;
		}
		//----------------------------
		//
		// Public methods
		//
		//----------------------------
		/**
		 * @inheritDoc
		 */
		public function hasMembers():Boolean {
			return (this._listMembers == null || this._listMembers.length < 1)?false:true;
		}
		
		/**
		 * @inheritDoc
		 */
		public function addMember(value:String):void {
			if ( value == null || value == "" ) {
				return;
			}
			if ( this._isSetOfMembers ) {
				this._listMembers.push(value);
			}
			else {
				this._listMembers[0] = value;
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function addMemberAt(value:String, pos:Number):void {
			if ( value == null || value == "" || isNaN(pos) || pos < 0 || pos > this._listMembers.length) {
				return;
			}
			
			var v:Vector.<String> = this._listMembers.slice(0, pos);
			v.push(value);
			v = v.concat(this._listMembers.slice(pos));
			this._listMembers = v;
		}
		
		/**
		 * @inheritDoc
		 */
		public function getMemberAt(pos:Number):String {
			if ( isNaN(pos) || pos < 0 || pos >= this._listMembers.length ) {
				return "";
			}
			return this._listMembers[pos];
		}
		
		/**
		 * @inheritDoc
		 */
		public function remMemberAt(pos:Number):void {
			if ( isNaN(pos) || pos < 0 || pos >= this._listMembers.length) {
				return;
			}
			var v:Vector.<String> = this._listMembers.slice(0, pos);
			v = v.concat(this._listMembers.slice(pos+1));
			this._listMembers = v;
		}
		
		/**
		 * @inheritDoc
		 */
		public function clear():void {
			this._listMembers = new Vector.<String>();
		}
		
		
		/**
		 * @inheritDoc
		 */
		public function generate():String {
			if ( this._listMembers != null && this._listMembers.length > 0 ) {
				if ( this.isSetOfMembers ) {
					return "{" + this._listMembers.join(", ") + "}";
				}
				return this._listMembers[0]+((this._addMemberRef)?this._refMemberText:"");
			}
			return "";
		}
	}
}