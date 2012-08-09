require 'spec_helper'

describe Object do
  describe "#tryit" do
    let(:obj) { Object.new }

    it "doesn't catch unspecified exceptions" do
      class A; def foo; raise "test exception" end end
      expect do
        A.new.tryit{ foo }
      end.to raise_error(RuntimeError, "test exception")
    end

    it "does not raise NameError" do
      expect{ obj.tryit{ foo } }.to_not raise_error(NameError)
    end
    it "yields to a provided block" do
      obj.should_receive(:foo)
      obj.tryit{ foo }
    end

    it "sends a method" do
      obj.should_receive(:foo)
      obj.tryit{ foo }
    end

    it "sends a method with arguments" do
      def obj.foo(arg); arg end
      obj.tryit(:foo, "arguments").should == "arguments"
    end

    it "test" do
      def obj.foo(arg); arg end
      expect{ obj.tryit{ foo("foo")} }.to_not raise_error
      obj.tryit{ foo("foo") }.should == "foo"
    end

    it "handles chained calls" do
      def obj.foo; self end
      def obj.boo; "boo" end
      obj.tryit{ foo.boo }.should == 'boo'
    end

    it "does not raise exceptions in chain calls" do
      def obj.foo; self end
      def obj.koo; self end
      expect{ obj.tryit{ foo.koo.too }}.to_not raise_error(NameError)
    end

  end
end
