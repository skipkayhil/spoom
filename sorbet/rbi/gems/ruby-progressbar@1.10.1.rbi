# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `ruby-progressbar` gem.
# Please instead update this file by running `bin/tapioca gem ruby-progressbar`.

class ProgressBar
  class << self
    def create(*args); end
  end
end

class ProgressBar::Base
  extend ::Forwardable

  def initialize(options = T.unsafe(nil)); end

  def clear(*args, &block); end
  def decrement; end
  def finish; end
  def finished?; end
  def format(other); end
  def format=(other); end
  def increment; end
  def inspect; end
  def log(*args, &block); end
  def pause; end
  def paused?; end
  def progress(*args, &block); end
  def progress=(new_progress); end
  def progress_mark=(mark); end
  def refresh(*args, &block); end
  def remainder_mark=(mark); end
  def reset; end
  def resume; end
  def start(options = T.unsafe(nil)); end
  def started?; end
  def stop; end
  def stopped?; end
  def title; end
  def title=(title); end
  def to_h; end
  def to_s(new_format = T.unsafe(nil)); end
  def total(*args, &block); end
  def total=(new_total); end

  protected

  def autofinish; end
  def autofinish=(_arg0); end
  def autostart; end
  def autostart=(_arg0); end
  def bar; end
  def bar=(_arg0); end
  def finished; end
  def finished=(_arg0); end
  def output; end
  def output=(_arg0); end
  def percentage; end
  def percentage=(_arg0); end
  def progressable; end
  def progressable=(_arg0); end
  def rate; end
  def rate=(_arg0); end
  def time; end
  def time=(_arg0); end
  def timer; end
  def timer=(_arg0); end
  def title_comp; end
  def title_comp=(_arg0); end
  def update_progress(*args); end
end

module ProgressBar::Calculators; end

class ProgressBar::Calculators::Length
  def initialize(options = T.unsafe(nil)); end

  def calculate_length; end
  def current_length; end
  def current_length=(_arg0); end
  def length; end
  def length_changed?; end
  def length_override; end
  def length_override=(other); end
  def output; end
  def output=(_arg0); end
  def reset_length; end

  private

  def dynamic_width; end
  def dynamic_width_stty; end
  def dynamic_width_tput; end
  def dynamic_width_via_io_object; end
  def dynamic_width_via_output_stream_object; end
  def dynamic_width_via_system_calls; end
  def terminal_width; end
  def unix?; end
end

class ProgressBar::Calculators::RunningAverage
  class << self
    def calculate(current_average, new_value_to_average, smoothing_factor); end
  end
end

module ProgressBar::Components; end

class ProgressBar::Components::Bar
  def initialize(options = T.unsafe(nil)); end

  def length; end
  def length=(_arg0); end
  def progress; end
  def progress=(_arg0); end
  def progress_mark; end
  def progress_mark=(_arg0); end
  def remainder_mark; end
  def remainder_mark=(_arg0); end
  def to_s(options = T.unsafe(nil)); end
  def upa_steps; end
  def upa_steps=(_arg0); end

  private

  def bar(length); end
  def bar_with_percentage(length); end
  def complete_bar(length); end
  def complete_bar_with_percentage(length); end
  def completed_length; end
  def incomplete_space(length); end
  def incomplete_string; end
  def integrated_percentage_complete_string; end
  def standard_complete_string; end
  def unknown_progress_frame; end
  def unknown_string; end
end

ProgressBar::Components::Bar::DEFAULT_PROGRESS_MARK = T.let(T.unsafe(nil), String)
ProgressBar::Components::Bar::DEFAULT_REMAINDER_MARK = T.let(T.unsafe(nil), String)
ProgressBar::Components::Bar::DEFAULT_UPA_STEPS = T.let(T.unsafe(nil), Array)

class ProgressBar::Components::Percentage
  def initialize(options = T.unsafe(nil)); end

  def progress; end
  def progress=(_arg0); end

  private

  def justified_percentage; end
  def justified_percentage_with_precision; end
  def percentage; end
  def percentage_with_precision; end
end

class ProgressBar::Components::Rate
  def initialize(options = T.unsafe(nil)); end

  def progress; end
  def progress=(_arg0); end
  def rate_scale; end
  def rate_scale=(_arg0); end
  def started_at; end
  def started_at=(_arg0); end
  def stopped_at; end
  def stopped_at=(_arg0); end
  def timer; end
  def timer=(_arg0); end

  private

  def base_rate; end
  def elapsed_seconds; end
  def rate_of_change(format_string = T.unsafe(nil)); end
  def rate_of_change_with_precision; end
  def scaled_rate; end
end

class ProgressBar::Components::Time
  def initialize(options = T.unsafe(nil)); end

  def elapsed_with_label; end
  def estimated_with_label; end

  protected

  def estimated_with_friendly_oob; end
  def estimated_with_no_oob; end
  def estimated_with_unknown_oob; end
  def out_of_bounds_time_format; end
  def out_of_bounds_time_format=(format); end
  def progress; end
  def progress=(_arg0); end
  def timer; end
  def timer=(_arg0); end

  private

  def elapsed; end
  def estimated; end
  def estimated_seconds_remaining; end
  def estimated_with_elapsed_fallback; end
  def out_of_bounds_time; end
end

ProgressBar::Components::Time::ELAPSED_LABEL = T.let(T.unsafe(nil), String)
ProgressBar::Components::Time::ESTIMATED_LABEL = T.let(T.unsafe(nil), String)
ProgressBar::Components::Time::NO_TIME_ELAPSED_TEXT = T.let(T.unsafe(nil), String)
ProgressBar::Components::Time::OOB_FRIENDLY_TIME_TEXT = T.let(T.unsafe(nil), String)
ProgressBar::Components::Time::OOB_LIMIT_IN_HOURS = T.let(T.unsafe(nil), Integer)
ProgressBar::Components::Time::OOB_TIME_FORMATS = T.let(T.unsafe(nil), Array)
ProgressBar::Components::Time::OOB_UNKNOWN_TIME_TEXT = T.let(T.unsafe(nil), String)
ProgressBar::Components::Time::TIME_FORMAT = T.let(T.unsafe(nil), String)

class ProgressBar::Components::Title
  def initialize(options = T.unsafe(nil)); end

  def title; end
  def title=(_arg0); end
end

ProgressBar::Components::Title::DEFAULT_TITLE = T.let(T.unsafe(nil), String)
module ProgressBar::Format; end

class ProgressBar::Format::Formatter
  class << self
    def process(format_string, max_length, bar); end
  end
end

class ProgressBar::Format::Molecule
  def initialize(letter); end

  def bar_molecule?; end
  def full_key; end
  def key; end
  def key=(_arg0); end
  def lookup_value(environment, length = T.unsafe(nil)); end
  def method_name; end
  def method_name=(_arg0); end
  def non_bar_molecule?; end
end

ProgressBar::Format::Molecule::BAR_MOLECULES = T.let(T.unsafe(nil), Array)
ProgressBar::Format::Molecule::MOLECULES = T.let(T.unsafe(nil), Hash)

class ProgressBar::Format::String < ::String
  def bar_molecule_placeholder_length; end
  def bar_molecules; end
  def displayable_length; end
  def molecules; end
  def non_bar_molecules; end
end

ProgressBar::Format::String::ANSI_SGR_PATTERN = T.let(T.unsafe(nil), Regexp)
ProgressBar::Format::String::MOLECULE_PATTERN = T.let(T.unsafe(nil), Regexp)
class ProgressBar::InvalidProgressError < ::RuntimeError; end

class ProgressBar::Output
  def initialize(options = T.unsafe(nil)); end

  def clear_string; end
  def length; end
  def log(string); end
  def refresh(options = T.unsafe(nil)); end
  def stream; end
  def stream=(_arg0); end
  def with_refresh; end

  protected

  def bar; end
  def bar=(_arg0); end
  def length_calculator; end
  def length_calculator=(_arg0); end
  def throttle; end
  def throttle=(_arg0); end

  private

  def print_and_flush; end

  class << self
    def detect(options = T.unsafe(nil)); end
  end
end

ProgressBar::Output::DEFAULT_OUTPUT_STREAM = T.let(T.unsafe(nil), IO)
module ProgressBar::Outputs; end

class ProgressBar::Outputs::NonTty < ::ProgressBar::Output
  def bar_update_string; end
  def clear; end
  def default_format; end
  def eol; end
  def last_update_length; end
  def refresh_with_format_change(*_arg0); end
  def resolve_format(*_arg0); end

  protected

  def last_update_length=(_arg0); end
end

ProgressBar::Outputs::NonTty::DEFAULT_FORMAT_STRING = T.let(T.unsafe(nil), String)

class ProgressBar::Outputs::Tty < ::ProgressBar::Output
  def bar_update_string; end
  def clear; end
  def default_format; end
  def eol; end
  def refresh_with_format_change; end
  def resolve_format(other_format); end
end

ProgressBar::Outputs::Tty::DEFAULT_FORMAT_STRING = T.let(T.unsafe(nil), String)

class ProgressBar::Progress
  def initialize(options = T.unsafe(nil)); end

  def absolute; end
  def decrement; end
  def finish; end
  def finished?; end
  def increment; end
  def none?; end
  def percentage_completed; end
  def percentage_completed_with_precision; end
  def progress; end
  def progress=(new_progress); end
  def reset; end
  def running_average; end
  def running_average=(_arg0); end
  def smoothing; end
  def smoothing=(_arg0); end
  def start(options = T.unsafe(nil)); end
  def starting_position; end
  def starting_position=(_arg0); end
  def total; end
  def total=(new_total); end
  def total_with_unknown_indicator; end
  def unknown?; end
end

ProgressBar::Progress::DEFAULT_BEGINNING_POSITION = T.let(T.unsafe(nil), Integer)
ProgressBar::Progress::DEFAULT_SMOOTHING = T.let(T.unsafe(nil), Float)
ProgressBar::Progress::DEFAULT_TOTAL = T.let(T.unsafe(nil), Integer)
module ProgressBar::Refinements; end
module ProgressBar::Refinements::Enumerator; end

class ProgressBar::Throttle
  def initialize(options = T.unsafe(nil)); end

  def choke(options = T.unsafe(nil)); end
  def rate; end
  def rate=(_arg0); end
  def started_at; end
  def started_at=(_arg0); end
  def stopped_at; end
  def stopped_at=(_arg0); end
  def timer; end
  def timer=(_arg0); end
end

class ProgressBar::Time
  def initialize(time = T.unsafe(nil)); end

  def now; end
  def unmocked_time_method; end

  protected

  def time; end
  def time=(_arg0); end
end

ProgressBar::Time::TIME_MOCKING_LIBRARY_METHODS = T.let(T.unsafe(nil), Array)

class ProgressBar::Timer
  def initialize(options = T.unsafe(nil)); end

  def divide_seconds(seconds); end
  def elapsed_seconds; end
  def elapsed_whole_seconds; end
  def pause; end
  def reset; end
  def reset?; end
  def restart; end
  def resume; end
  def start; end
  def started?; end
  def started_at; end
  def started_at=(_arg0); end
  def stop; end
  def stopped?; end
  def stopped_at; end
  def stopped_at=(_arg0); end

  protected

  def time; end
  def time=(_arg0); end
end
