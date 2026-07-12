# frozen_string_literal: true

# Toggles sandbox behaviour for this self-hosted, fake-money instance. When
# enabled, transfers auto-approve and the external bank rails (Column/Increase)
# are simulated as instantly completed instead of being sent for real.
#
# Defaults on everywhere except the test environment (so the existing suite keeps
# exercising the real state machines). Override with HCB_SANDBOX_MODE=true|false.
module Sandbox
  def self.enabled?
    ENV.fetch("HCB_SANDBOX_MODE") { Rails.env.test? ? "false" : "true" } == "true"
  end
end
