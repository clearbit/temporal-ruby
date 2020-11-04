require 'temporal/metadata/workflow_task'

describe Temporal::Metadata::WorkflowTask do
  describe '#initialize' do
    subject { described_class.new(**args.to_h) }
    let(:args) { Fabricate(:workflow_task_metadata) }

    it 'sets the attributes' do
      expect(subject.namespace).to eq(args.namespace)
      expect(subject.id).to eq(args.id)
      expect(subject.task_token).to eq(args.task_token)
      expect(subject.attempt).to eq(args.attempt)
      expect(subject.workflow_run_id).to eq(args.workflow_run_id)
      expect(subject.workflow_id).to eq(args.workflow_id)
      expect(subject.workflow_name).to eq(args.workflow_name)
    end

    it { is_expected.to be_frozen }
    it { is_expected.not_to be_activity }
    it { is_expected.to be_workflow_task }
    it { is_expected.not_to be_workflow }
  end
end
