import * as v from "valibot";

export const ContainerInstanceStatus = v.object({
	status: v.picklist([
		"queued",
		"running",
		"paused",
		"errored",
		"terminated",
		"complete",
		"waiting",
		"waitingForPause",
		"unknown",
	]),
	error: v.optional(v.string()),
	output: v.optional(v.object({})),
});

export type ContainerInstanceStatus = v.InferOutput<
	typeof ContainerInstanceStatus
>;
