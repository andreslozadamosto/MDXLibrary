package test.integration
{
	import com.mdxlibrary.MDXAxis;
	import com.mdxlibrary.MDXAxisItem;
	import com.mdxlibrary.MDXQuery;
	import com.mdxlibrary.axisdata.AxisCrossJoin;
	import com.mdxlibrary.axisdata.AxisDataItem;
	import com.mdxlibrary.axisdata.AxisNonEmpty;
	import com.mdxlibrary.axisitemdecorators.SubsetAxisItemDecorator;
	import com.mdxlibrary.interfaces.IAxisDataItem;
	import com.mdxlibrary.interfaces.IMDXAxisItem;
	
	import org.flexunit.asserts.assertEquals;
	
	import spark.effects.AddAction;

	public class MDXQueryIntegrationTest
	{		
		private var _mdxQuery:MDXQuery;
		
		[Before]
		public function setUp():void
		{
			this._mdxQuery = new MDXQuery();
			this._mdxQuery.cubeName = "VENTAS";
		}
		
		[Test]
		public function generate_test():void {
			var axis:MDXAxis = new MDXAxis();
			var item:IAxisDataItem;
			
			//add row axis with a crossjoin
			axis.type = MDXAxis.ROW_AXIS;
			axis.add(new AxisNonEmpty());
			item = new AxisCrossJoin();
			item.add("[MONTH].Members");
			axis.add(item);
			item = new AxisDataItem();
			item.add("[Selers].Members");
			axis.add(item);
			this._mdxQuery.addAxis(axis);
			
			//add column axis with one dimension
			axis = new MDXAxis();
			axis.type = MDXAxis.COLUMN_AXIS;
			item = new AxisDataItem();
			var axisItem:IMDXAxisItem = new MDXAxisItem();
			axisItem.addMember("[Country]");
			axisItem = new SubsetAxisItemDecorator(axisItem);
			(axisItem as SubsetAxisItemDecorator).maxValue = 10;
			item.addAxisItem(axisItem);
			axis.add(item);
			this._mdxQuery.addAxis(axis);
			
			var s:String = this._mdxQuery.generate();
			var compare:String = "SELECT\n\t"+
								"NON EMPTY { CrossJoin( [MONTH].Members, [Selers].Members ) } ON ROWS,\n\t"+
								"SUBSET ( [Country].Members, 0, 10 ) ON COLUMNS,\n"+
								"FROM VENTAS";
			assertEquals(compare, s);
		}
		
	}
}