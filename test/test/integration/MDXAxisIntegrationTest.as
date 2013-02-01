package test.integration
{
	import com.mdxlibrary.MDXAxis;
	import com.mdxlibrary.axisdata.AxisCrossJoin;
	import com.mdxlibrary.axisdata.AxisDataItem;
	import com.mdxlibrary.axisdata.AxisNonEmpty;
	import com.mdxlibrary.interfaces.IAxisDataItem;
	
	import org.flexunit.asserts.assertEquals;

	public class MDXAxisIntegrationTest
	{
		public function MDXAxisIntegrationTest()
		{
		}
		
		[Test]
		public function generate_test():void {
			var axis:MDXAxis = new MDXAxis();
			var item:IAxisDataItem;
			
			axis.type = MDXAxis.ROW_AXIS;
			
			axis.add(new AxisNonEmpty());
			item = new AxisCrossJoin();
			item.add("[OCAL_MONTH].Members");
			axis.add(item);
			item = new AxisDataItem();
			item.add("[OSHIPTO].Members");
			axis.add(item);
			
			var s:String = axis.generate();
			
			assertEquals("NON EMPTY { CrossJoin( [OCAL_MONTH].Members, [OSHIPTO].Members ) } ON ROWS", s);
		}
	}
}