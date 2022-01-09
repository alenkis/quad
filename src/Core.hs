module Core where

import RIO

data Pipeline = Pipeline
  { steps :: [Step]
  }
  deriving (Eq, Show)

data Step = Step
  { stepName :: StepName,
    stepImage :: Image,
    stepCommands :: [Text]
  }
  deriving (Eq, Show)

data Build = Build
  { pipeline :: Pipeline,
    state :: BuildState
  }
  deriving (Eq, Show)

data BuildState
  = BuildReady
  | BuildRunning
  | BuildFinished BuildResult
  deriving (Eq, Show)

data BuildResult
  = BuildSucceeded
  | BuildFailed
  deriving (Eq, Show)

newtype StepName = StepName Text
  deriving (Eq, Show)

newtype Image = Image Text deriving (Eq, Show)

stepNameToText :: StepName -> Text
stepNameToText (StepName sn) = sn

imageToText :: Image -> Text
imageToText (Image img) = img
