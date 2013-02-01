package test.mdxlibrary.mdx
{
	import com.mdxlibrary.MDXAxis;
	import com.mdxlibrary.interfaces.IAxisDataItem;
	
	import flash.events.Event;
	
	import mockolate.mock;
	import mockolate.prepare;
	import mockolate.strict;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;

	public class MDXAxisTest
	{		
		private var _mdxAxis:MDXAxis;
		
		[Before(async, timeout=5000, order=1)]
		public function setUp1():void
		{
			Async.proceedOnEvent(this,
				prepare(IAxisDataItem),
				Event.COMPLETE);
		}
		
		[Before(order=2)]
		public function setUp():void
		{
			this._mdxAxis = new MDXAxis();
		}
		
		// test type
		[Test]
		public function typeDefault_test():void {
			assertEquals("NaN", this._mdxAxis.type.toString());
		}
		
		[Test]
		public function typeWithValue_test():void {
			this._mdxAxis.type = MDXAxis.COLUMN_AXIS;
			
			assertEquals(MDXAxis.COLUMN_AXIS, this._mdxAxis.type);
		}
		
		// test isEmpty
		[Test]
		public function isEmptyDefault_test():void {
			assertTrue(this._mdxAxis.isEmpty);
		}
		
		// test length
		[Test]
		public function lengthDefault_test():void {
			assertEquals(0, this._mdxAxis.length);
		}
		
		//test add
		[Test]
		public function addNull_test():void {
			this._mdxAxis.add(null);
			
			assertEquals(0, this._mdxAxis.length);
		}
		
		[Test]
		public function addOneValue_test():void {
			this._mdxAxis.add(strict(IAxisDataItem));
			
			assertEquals(1, this._mdxAxis.length);
		}
		
		[Test]
		public function addMoreThanOneValues_test():void {
			this._mdxAxis.add(strict(IAxisDataItem));
			this._mdxAxis.add(strict(IAxisDataItem));
			this._mdxAxis.add(strict(IAxisDataItem));
			
			assertEquals(3, this._mdxAxis.length);
		}
		
		//test addAt
		[Test]
		public function addAtNullValue_test():void {
			this._mdxAxis.addAt(null, 0);
			
			assertEquals(0, this._mdxAxis.length);
		}
		
		[Test]
		public function addAtFirstWithoutInside_test():void {
			this._mdxAxis.addAt(strict(IAxisDataItem), 0);
			
			assertEquals(1, this._mdxAxis.length);
		}
		
		[Test]
		public function addAtFistWithValuesInside_test():void {
			this._mdxAxis.add(strict(IAxisDataItem));
			this._mdxAxis.add(strict(IAxisDataItem));
			this._mdxAxis.add(strict(IAxisDataItem));
			
			var mocks:* = strict(IAxisDataItem)
			this._mdxAxis.addAt(mocks, 0);
			
			assertEquals(4, this._mdxAxis.length);
			
			assertEquals(mocks, this._mdxAxis.getItemAt(0));
		}
		
		[Test]
		public function addAtMiddleWithValuesInside_test():void {
			this._mdxAxis.add(strict(IAxisDataItem));
			this._mdxAxis.add(strict(IAxisDataItem));
			this._mdxAxis.add(strict(IAxisDataItem));
			
			var mocks:* = strict(IAxisDataItem)
			this._mdxAxis.addAt(mocks, 1);
			
			assertEquals(4, this._mdxAxis.length);
			
			assertEquals(mocks, this._mdxAxis.getItemAt(1));
		}
		
		[Test]
		public function addAtLastWithValuesInside_test():void {
			this._mdxAxis.add(strict(IAxisDataItem));
			this._mdxAxis.add(strict(IAxisDataItem));
			this._mdxAxis.add(strict(IAxisDataItem));
			
			var mocks:* = strict(IAxisDataItem)
			this._mdxAxis.addAt(mocks, 3);
			
			assertEquals(4, this._mdxAxis.length);
			
			assertEquals(mocks, this._mdxAxis.getItemAt(3));
		}
		
		
	}
}