package agent

import (
	"fmt"
	"sync"

	"github.com/rikinyan/proglog/internal/log"
	"github.com/rikinyan/proglog/internal/discovery"
	"google.golang.org/grpc"
)

type Agent struct {
	log *log.Log
	server *grpc.Server
	membership *discovery.Membership
	replicator *log.Replicator
	shutdown bool
	shutdowns chan struct{}
	shutdownLock sync.Mutex
}

