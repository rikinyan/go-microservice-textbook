compile:
	protoc ./StructureDataWithProtobuf/api/v1/*.proto \     ✘ INT 01:51:42 AM
	--go_out=. \
	--go_opt=paths=source_relative \
	--proto_path=.

test:
	go test -race ./..
