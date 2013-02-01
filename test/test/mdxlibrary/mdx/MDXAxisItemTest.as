package test.mdxlibrary.mdx
{
	
	
	import com.mdxlibrary.MDXAxisItem;
	
	import org.flexunit.asserts.assertEquals;

	public class MDXAxisItemTest
	{		
		private var _axisItem:MDXAxisItem;
		
		[Before]
		public function setUp():void {
			this._axisItem = new MDXAxisItem();
		} 
		
		//test isSetOfMembers
		[Test]
		public function isSetOfMembersDefault_test():void {
			assertEquals(false, this._axisItem.isSetOfMembers);
		}
		
		[Test]
		public function isSetOfMembersChange_test():void {
			this._axisItem.isSetOfMembers = true;
			assertEquals(true, this._axisItem.isSetOfMembers);
		}
		
		//test addMemberRef
		[Test]
		public function addMemberRefDefault_test():void {
			assertEquals(true, this._axisItem.addMemberRef);
		}
		
		[Test]
		public function addMemberRefChange_test():void {
			this._axisItem.addMemberRef = false;
			assertEquals(false, this._axisItem.addMemberRef);
		}
		
		// test length 
		[Test]
		public function lengthDefault_test():void {
			assertEquals(0, this._axisItem.length);
		}
		
		// test addMember
		[Test]
		public function addMemberNullValue_test():void {
			this._axisItem.addMember(null);
			
			assertEquals(0, this._axisItem.length);
		}
		
		[Test]
		public function addMemberEmptyValue_test():void {
			this._axisItem.addMember("");
			
			assertEquals(0, this._axisItem.length);
		}
		
		[Test]
		public function addMemberOneValue_test():void {
			this._axisItem.addMember("Data_1");
			
			assertEquals(1, this._axisItem.length);
		}
		
		[Test]
		public function addMemberMoreThanOneValue_test():void {
			this._axisItem.isSetOfMembers = true;
			this._axisItem.addMember("Data_1");
			this._axisItem.addMember("Data_2");
			this._axisItem.addMember("Data_3");
			
			assertEquals(3, this._axisItem.length);
		}
		
		[Test]
		public function addMemberMoreThanOneValueIsSetOfMembersFalse_test():void {
			this._axisItem.addMember("Data_1");
			this._axisItem.addMember("Data_2");
			this._axisItem.addMember("Data_3");
			
			assertEquals(1, this._axisItem.length);
			
			assertEquals("Data_3", this._axisItem.getMemberAt(0));
		}
		
		//test addMemberAt
		[Test]
		public function addMemberAtNullValue_test():void {
			this._axisItem.addMemberAt(null, 1);
			
			assertEquals(0, this._axisItem.length);
		}
		
		[Test]
		public function addMemberAtEmptyValue_Test():void {
			this._axisItem.addMemberAt("", 9);
			
			assertEquals(0, this._axisItem.length);
		}
		
		[Test]
		public function addMemberAtNanPos_test():void {
			this._axisItem.addMemberAt("data_1", NaN);
			
			assertEquals(0, this._axisItem.length);
		}
		
		[Test]
		public function addMemberAtFirsPos_test():void {
			this._axisItem.addMemberAt("data_1", 0);
			
			assertEquals(1, this._axisItem.length);
		}
		
		[Test]
		public function addMemberAtFistPosLater_test():void {
			this._axisItem.isSetOfMembers = true;
			this._axisItem.addMember("data_1");
			this._axisItem.addMember("data_2");
			this._axisItem.addMemberAt("data_3", 0);
			
			assertEquals(3, this._axisItem.length);
			
			assertEquals("data_3", this._axisItem.getMemberAt(0));
		}
		
		[Test]
		public function addMemberAtFistPosWithOneValueInside_test():void {
			this._axisItem.isSetOfMembers = true;
			this._axisItem.addMember("data_1");
			this._axisItem.addMemberAt("data_2", 0);
			
			assertEquals(2, this._axisItem.length);
			
			assertEquals("data_2", this._axisItem.getMemberAt(0));
		}
		
		[Test]
		public function addMemberAtMiddle_test():void {
			this._axisItem.isSetOfMembers = true;
			this._axisItem.addMember("data_1");
			this._axisItem.addMember("data_2");
			this._axisItem.addMember("data_3");
			this._axisItem.addMemberAt("data_4", 1);
			
			assertEquals(4, this._axisItem.length);
			
			assertEquals("data_4", this._axisItem.getMemberAt(1));
		}
		
		[Test]
		public function addMemberAtEnd_test():void {
			this._axisItem.isSetOfMembers = true;
			this._axisItem.addMember("data_1");
			this._axisItem.addMember("data_2");
			this._axisItem.addMemberAt("data_3",2);
			
			assertEquals(3, this._axisItem.length);
			
			assertEquals("data_3", this._axisItem.getMemberAt(2));
		}
		
		[Test]
		public function addMemberAtOutOfRangeEmpty_test():void {
			this._axisItem.addMemberAt("data", 9);
			
			assertEquals(0, this._axisItem.length);
		}
		
		[Test]
		public function addMemberAtOutOfRangeWithData_test():void {
			this._axisItem.isSetOfMembers = true;
			this._axisItem.addMember("data_1");
			this._axisItem.addMember("data_2");
			this._axisItem.addMemberAt("data_3", 9);
			
			assertEquals(2, this._axisItem.length);
		}
		
		[Test]
		public function addMemberNegativePos_test():void {
			this._axisItem.isSetOfMembers = true;
			this._axisItem.addMember("data_1");
			this._axisItem.addMember("data_2");
			this._axisItem.addMemberAt("data_3", -9);
			
			assertEquals(2, this._axisItem.length);
		}
		
		//test getMemberAt
		[Test]
		public function getMemberAtNANValue_test():void {
			this._axisItem.addMember("data_1");
			
			assertEquals("", this._axisItem.getMemberAt(Number.NaN));
		}
		
		[Test]
		public function getMemberAtNegativeValue_test():void {
			this._axisItem.addMember("data_1");
			
			assertEquals("", this._axisItem.getMemberAt(-1));
		}
		
		[Test]
		public function getMemberAtOKValue_test():void {
			this._axisItem.addMember("data_1");
			
			assertEquals("data_1", this._axisItem.getMemberAt(0));
		}
		
		[Test]
		public function getMemberAtOKValueMoreOneValueInside_test():void {
			this._axisItem.isSetOfMembers = true;
			this._axisItem.addMember("data_1");
			this._axisItem.addMember("data_2");
			this._axisItem.addMember("data_3");
			
			assertEquals("data_2", this._axisItem.getMemberAt(1));
		}
		
		[Test]
		public function getMemberAtOutOfRange_test():void {
			this._axisItem.isSetOfMembers = true;
			this._axisItem.addMember("data_1");
			this._axisItem.addMember("data_2");
			this._axisItem.addMember("data_3");
			
			assertEquals("", this._axisItem.getMemberAt(7));
		}
		
		// test remMemberAt
		[Test]
		public function remMemberAtNaNPos_test():void {
			this._axisItem.addMember("data_1");
			this._axisItem.remMemberAt(NaN);
			
			assertEquals(1, this._axisItem.length);
		}
		
		[Test]
		public function remMemberAtOutOfRange_test():void {
			this._axisItem.addMember("data_1");
			this._axisItem.remMemberAt(5);
			
			assertEquals(1, this._axisItem.length);
		}
		
		[Test]
		public function remMemberAtOKValue_test():void {
			this._axisItem.addMember("data_1");
			this._axisItem.remMemberAt(0);
			
			assertEquals(0, this._axisItem.length);
		}
		
		[Test]
		public function remMemberAtMoreThanOneValue_test():void {
			this._axisItem.isSetOfMembers = true;
			this._axisItem.addMember("data_1");
			this._axisItem.addMember("data_2");
			this._axisItem.addMember("data_3");
			this._axisItem.addMember("data_4");
			this._axisItem.addMember("data_5");
			this._axisItem.remMemberAt(1);
			this._axisItem.remMemberAt(3);
			
			assertEquals(3, this._axisItem.length);
		}
		
		//test generate
		[Test]
		public function generateWithOutData_test():void {
			assertEquals("", this._axisItem.generate());
		}
		
		[Test]
		public function generateWithOneValue_test():void {
			this._axisItem.addMember("data_1");
			
			var result:String = "data_1.Members";
			
			assertEquals(result, this._axisItem.generate());
		}
		
		[Test]
		public function generateWithOneValueAddMemberRefFalse_test():void {
			this._axisItem.addMember("data_1");
			this._axisItem.addMemberRef = false;
			
			assertEquals("data_1", this._axisItem.generate());
		}
		
		[Test]
		public function generateWithMoreThanOneValue_test():void {
			this._axisItem.isSetOfMembers = true;
			this._axisItem.addMember("data_1");
			this._axisItem.addMember("data_2");
			
			assertEquals("{data_1, data_2}", this._axisItem.generate());
		}
		
		[Test]
		public function generateWithOneValuIsSetOfMembersTrue_test():void {
			this._axisItem.isSetOfMembers = true;
			this._axisItem.addMember("data_1");
			
			assertEquals("{data_1}", this._axisItem.generate());
		}
	}
}