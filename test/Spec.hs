module Spec where

import Core
import RIO

makeStep :: Text -> Text -> [Text] -> Step
makeStep name image commands =
  Step
    { stepName = StepName name,
      stepImage = Image image,
      stepCommands = commands
    }

makePipeline :: [Step] -> Pipeline
makePipeline s = Pipeline {steps = s}

testPipeline :: Pipeline
testPipeline =
  makePipeline
    [ makeStep "First step" "ubuntu" ["date"],
      makeStep "Second step" "ubuntu" ["uname -r"]
    ]

testBuild :: Build
testBuild =
  Build
    { pipeline = testPipeline,
      state = BuildReady
    }

main :: IO ()
main = pure ()
