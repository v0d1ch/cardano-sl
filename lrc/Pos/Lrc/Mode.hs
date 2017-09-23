{-# LANGUAGE DataKinds #-}

-- | Set of constraints used by LRC.

module Pos.Lrc.Mode
       ( LrcMode
       ) where

import           Universum

import           Ether.Internal  (HasLens (..))
import           Mockable        (Async, Concurrently, Delay, Mockables)
import           System.Wlog     (WithLogger)

import           Pos.Core        (HasConfiguration)
import           Pos.DB.Class    (MonadDB, MonadGState)
import           Pos.Lrc.Context (HasLrcContext)

-- | Set of constraints used by LRC.
type LrcMode ssc ctx m
     = ( WithLogger m
       , MonadMask m
       , MonadGState m
       , MonadDB m
       , MonadIO m
       , Mockables m [Async, Concurrently, Delay]
       , MonadReader ctx m
       , HasLrcContext ctx
       , HasConfiguration
       )
