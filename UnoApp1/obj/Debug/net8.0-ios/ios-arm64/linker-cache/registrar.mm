#define DEBUG 1
#include <xamarin/xamarin.h>
#include "registrar.h"
extern "C" {
static id native_to_managed_trampoline_1 (id self, SEL _cmd, MonoMethod **managed_method_ptr, bool* call_super, uint32_t token_ref)
{
	MonoClass *declaring_type = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	bool has_nsobject = xamarin_has_nsobject (self, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	if (has_nsobject) {
		*call_super = true;
		goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	declaring_type = mono_method_get_class (managed_method);
	mthis = xamarin_new_nsobject (self, declaring_type, &exception_gchandle);
	xamarin_mono_object_release (&declaring_type);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return self;
}


static BOOL native_to_managed_trampoline_2 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_3 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_4 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, void * p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	void * a1 = p1;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &a1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_5 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static BOOL native_to_managed_trampoline_6 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_7 (id self, SEL _cmd, MonoMethod **managed_method_ptr, BOOL p0, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_8 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static CGSize native_to_managed_trampoline_9 (id self, SEL _cmd, MonoMethod **managed_method_ptr, CGSize p0, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	CGSize res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(CGSize *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static CGRect native_to_managed_trampoline_10 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	CGRect res = {{0}};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(CGRect *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_11 (id self, SEL _cmd, MonoMethod **managed_method_ptr, CGRect p0, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static id native_to_managed_trampoline_12 (id self, SEL _cmd, MonoMethod **managed_method_ptr, CGPoint p0, id p1, uint32_t token_ref)
{
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_waypoint ();
		[retobj retain];
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static id native_to_managed_trampoline_13 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_waypoint ();
		[retobj retain];
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static BOOL native_to_managed_trampoline_14 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	MonoObject *del2 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	if (p2) {
		del2 = xamarin_get_delegate_for_block_parameter (managed_method, 0x1F /* UIKit.UIApplicationRestorationHandler ObjCRuntime.Trampolines/NIDUIApplicationRestorationHandler::Create(System.IntPtr) */ , 2, p2, &exception_gchandle);
		arg_ptrs [2] = del2;
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	} else {
		arg_ptrs [2] = NULL;
	}

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&del2);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static BOOL native_to_managed_trampoline_15 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoClass *paramclass2 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
		paramclass2 = mono_class_from_mono_type (paramtype2);
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, paramclass2, managed_method);
	}
	arg_ptrs [2] = mobj2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&paramclass2);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_16 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	MonoObject *del2 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	if (p2) {
		del2 = xamarin_get_delegate_for_block_parameter (managed_method, 0x21 /* UIKit.UIOperationHandler ObjCRuntime.Trampolines/NIDUIOperationHandler::Create(System.IntPtr) */ , 2, p2, &exception_gchandle);
		arg_ptrs [2] = del2;
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	} else {
		arg_ptrs [2] = NULL;
	}

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&del2);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static NSUInteger native_to_managed_trampoline_17 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	NSUInteger res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	if (created1) {
		xamarin_dispose (mobj1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}

	res = *(NSUInteger *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static id native_to_managed_trampoline_18 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_waypoint ();
		[retobj retain];
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_19 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, CGRect p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_20 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, BOOL p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static id native_to_managed_trampoline_21 (id self, SEL _cmd, MonoMethod **managed_method_ptr, BOOL p0, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_waypoint ();
		[retobj retain];
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_22 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, BOOL p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	arg_ptrs [2] = &p2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	if (created1) {
		xamarin_dispose (mobj1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static id native_to_managed_trampoline_23 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_waypoint ();
		[retobj retain];
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void * native_to_managed_trampoline_24 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, void * p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	void * a1 = p1;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	void * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &a1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(void * *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void * native_to_managed_trampoline_25 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	void * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(void * *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static CGSize native_to_managed_trampoline_26 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	CGSize res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(CGSize *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_27 (id self, SEL _cmd, MonoMethod **managed_method_ptr, CGSize p0, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static id native_to_managed_trampoline_28 (id self, SEL _cmd, MonoMethod **managed_method_ptr, CGRect p0, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = xamarin_managed_nsobject_array_to_nsarray ((MonoArray *) retval, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	xamarin_framework_peer_waypoint ();
	mt_dummy_use (retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_29 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	MonoArray *marr0 = NULL;
	NSArray *arr0 = NULL;
	MonoType *paramtype0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arr0 = p0;
	xamarin_check_objc_type (p0, [NSArray class], _cmd, self, 0, managed_method);
	paramtype0 = xamarin_get_parameter_type (managed_method, 0);
	marr0 = xamarin_nsarray_to_managed_nsobject_array (arr0, paramtype0, NULL, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = marr0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&marr0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static BOOL native_to_managed_trampoline_30 (id self, SEL _cmd, MonoMethod **managed_method_ptr, CGRect p0, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static id native_to_managed_trampoline_31 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, void * p1, void * p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	void * a1 = p1;
	void * a2 = p2;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &a1;
	arg_ptrs [2] = &a2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	if (!retval) {
		res = NULL;
	} else {
		res = xamarin_string_to_nsstring ((MonoString *) retval, false);
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static CGFloat native_to_managed_trampoline_32 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, void * p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	void * a1 = p1;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	CGFloat res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &a1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(CGFloat *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static id native_to_managed_trampoline_33 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, void * p1, void * p2, id p3, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	void * a1 = p1;
	void * a2 = p2;
	NSObject *nsobj3 = NULL;
	MonoObject *mobj3 = NULL;
	int32_t created3 = false;
	MonoType *paramtype3 = NULL;
	MonoClass *paramclass3 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &a1;
	arg_ptrs [2] = &a2;
	nsobj3 = (NSObject *) p3;
	if (nsobj3) {
		paramtype3 = xamarin_get_parameter_type (managed_method, 3);
		mobj3 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj3, false, paramtype3, &created3, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype3, 3, true);
			goto exception_handling;
		}
		paramclass3 = mono_class_from_mono_type (paramtype3);
		xamarin_verify_parameter (mobj3, _cmd, self, nsobj3, 3, paramclass3, managed_method);
	}
	arg_ptrs [3] = mobj3;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_waypoint ();
		[retobj retain];
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype3);
	xamarin_mono_object_release (&mobj3);
	xamarin_mono_object_release (&paramclass3);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_34 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, void * p1, void * p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	void * a1 = p1;
	void * a2 = p2;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &a1;
	arg_ptrs [2] = &a2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static BOOL native_to_managed_trampoline_35 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, NSRange p1, id p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoString *a2 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	a2 = xamarin_nsstring_to_string (NULL, p2);
	arg_ptrs [2] = a2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&a2);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static BOOL native_to_managed_trampoline_36 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static id native_to_managed_trampoline_37 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, id p3, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoClass *paramclass2 = NULL;
	NSObject *nsobj3 = NULL;
	MonoObject *mobj3 = NULL;
	int32_t created3 = false;
	MonoType *paramtype3 = NULL;
	MonoClass *paramclass3 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
		paramclass2 = mono_class_from_mono_type (paramtype2);
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, paramclass2, managed_method);
	}
	arg_ptrs [2] = mobj2;
	nsobj3 = (NSObject *) p3;
	if (nsobj3) {
		paramtype3 = xamarin_get_parameter_type (managed_method, 3);
		mobj3 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj3, false, paramtype3, &created3, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype3, 3, true);
			goto exception_handling;
		}
		paramclass3 = mono_class_from_mono_type (paramtype3);
		xamarin_verify_parameter (mobj3, _cmd, self, nsobj3, 3, paramclass3, managed_method);
	}
	arg_ptrs [3] = mobj3;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_waypoint ();
		[retobj retain];
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&paramclass2);
	xamarin_mono_object_release (&paramtype3);
	xamarin_mono_object_release (&mobj3);
	xamarin_mono_object_release (&paramclass3);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_38 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, id p3, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoString *a1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoClass *paramclass2 = NULL;
	MonoObject *del3 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	a1 = xamarin_nsstring_to_string (NULL, p1);
	arg_ptrs [1] = a1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
		paramclass2 = mono_class_from_mono_type (paramtype2);
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, paramclass2, managed_method);
	}
	arg_ptrs [2] = mobj2;
	if (p3) {
		del3 = xamarin_get_delegate_for_block_parameter (managed_method, 0x71 /* System.Action ObjCRuntime.Trampolines/NIDAction::Create(System.IntPtr) */ , 3, p3, &exception_gchandle);
		arg_ptrs [3] = del3;
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	} else {
		arg_ptrs [3] = NULL;
	}

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&a1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&paramclass2);
	xamarin_mono_object_release (&del3);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_39 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, id p3, id p4, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoString *a1 = NULL;
	MonoString *a2 = NULL;
	NSObject *nsobj3 = NULL;
	MonoObject *mobj3 = NULL;
	int32_t created3 = false;
	MonoType *paramtype3 = NULL;
	MonoClass *paramclass3 = NULL;
	MonoObject *del4 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [5];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	a1 = xamarin_nsstring_to_string (NULL, p1);
	arg_ptrs [1] = a1;
	a2 = xamarin_nsstring_to_string (NULL, p2);
	arg_ptrs [2] = a2;
	nsobj3 = (NSObject *) p3;
	if (nsobj3) {
		paramtype3 = xamarin_get_parameter_type (managed_method, 3);
		mobj3 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj3, false, paramtype3, &created3, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype3, 3, true);
			goto exception_handling;
		}
		paramclass3 = mono_class_from_mono_type (paramtype3);
		xamarin_verify_parameter (mobj3, _cmd, self, nsobj3, 3, paramclass3, managed_method);
	}
	arg_ptrs [3] = mobj3;
	if (p4) {
		del4 = xamarin_get_delegate_for_block_parameter (managed_method, 0x73 /* System.Action`1<System.String> ObjCRuntime.Trampolines/NIDActionArity1V70::Create(System.IntPtr) */ , 4, p4, &exception_gchandle);
		arg_ptrs [4] = del4;
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	} else {
		arg_ptrs [4] = NULL;
	}

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&a1);
	xamarin_mono_object_release (&a2);
	xamarin_mono_object_release (&paramtype3);
	xamarin_mono_object_release (&mobj3);
	xamarin_mono_object_release (&paramclass3);
	xamarin_mono_object_release (&del4);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_40 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, id p3, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoString *a1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoClass *paramclass2 = NULL;
	MonoObject *del3 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	a1 = xamarin_nsstring_to_string (NULL, p1);
	arg_ptrs [1] = a1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
		paramclass2 = mono_class_from_mono_type (paramtype2);
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, paramclass2, managed_method);
	}
	arg_ptrs [2] = mobj2;
	if (p3) {
		del3 = xamarin_get_delegate_for_block_parameter (managed_method, 0x75 /* System.Action`1<System.Boolean> ObjCRuntime.Trampolines/NIDActionArity1V4::Create(System.IntPtr) */ , 3, p3, &exception_gchandle);
		arg_ptrs [3] = del3;
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	} else {
		arg_ptrs [3] = NULL;
	}

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&a1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&paramclass2);
	xamarin_mono_object_release (&del3);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_41 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	MonoString *a0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	a0 = xamarin_nsstring_to_string (NULL, p0);
	arg_ptrs [0] = a0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&a0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static id native_to_managed_trampoline_42 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoClass *paramclass2 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
		paramclass2 = mono_class_from_mono_type (paramtype2);
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, paramclass2, managed_method);
	}
	arg_ptrs [2] = mobj2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_handle_for_inativeobject ((MonoObject *) retval, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		xamarin_framework_peer_waypoint ();
		if (retobj != NULL) {
			bool retained = xamarin_attempt_retain_nsobject (retval, &exception_gchandle);
			if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
			if (retained) {
				[retobj autorelease];
			}
			mt_dummy_use (retval);
			res = retobj;
		} else {
			res = NULL;
		}
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&paramclass2);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static id native_to_managed_trampoline_43 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_handle_for_inativeobject ((MonoObject *) retval, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		xamarin_framework_peer_waypoint ();
		if (retobj != NULL) {
			bool retained = xamarin_attempt_retain_nsobject (retval, &exception_gchandle);
			if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
			if (retained) {
				[retobj autorelease];
			}
			mt_dummy_use (retval);
			res = retobj;
		} else {
			res = NULL;
		}
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void * native_to_managed_trampoline_44 (id self, SEL _cmd, MonoMethod **managed_method_ptr, void * p0, uint32_t token_ref)
{
	void * a0 = p0;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	void * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &a0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(void * *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_45 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoClass *paramclass2 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
		paramclass2 = mono_class_from_mono_type (paramtype2);
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, paramclass2, managed_method);
	}
	arg_ptrs [2] = mobj2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&paramclass2);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static id native_to_managed_trampoline_46 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoClass *paramclass2 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
		paramclass2 = mono_class_from_mono_type (paramtype2);
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, paramclass2, managed_method);
	}
	arg_ptrs [2] = mobj2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	if (!retval) {
		res = NULL;
	} else {
		id retobj;
		retobj = xamarin_get_nsobject_handle (retval);
		xamarin_framework_peer_waypoint ();
		[retobj retain];
		[retobj autorelease];
		mt_dummy_use (retval);
		res = retobj;
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&paramclass2);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_47 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	MonoType *type0;
	MonoObject *inobj0 = NULL;
	MonoReflectionType *reflectiontype0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	type0 = xamarin_get_parameter_type (managed_method, 0);
	reflectiontype0 = mono_type_get_object (mono_domain_get (), type0);
	inobj0 = xamarin_get_inative_object_dynamic (p0, false, reflectiontype0, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = inobj0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&type0);
	xamarin_mono_object_release (&inobj0);
	xamarin_mono_object_release (&reflectiontype0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_48 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, CGPoint p1, CGPoint* p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;
	arg_ptrs [2] = p2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_49 (id self, SEL _cmd, MonoMethod **managed_method_ptr, CGPoint p0, BOOL p1, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;
	arg_ptrs [1] = &p1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void * native_to_managed_trampoline_50 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	void * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(void * *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_51 (id self, SEL _cmd, MonoMethod **managed_method_ptr, void * p0, uint32_t token_ref)
{
	void * a0 = p0;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &a0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static id native_to_managed_trampoline_52 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	if (!retval) {
		res = NULL;
	} else {
		res = xamarin_string_to_nsstring ((MonoString *) retval, false);
	}

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static CGRect native_to_managed_trampoline_53 (id self, SEL _cmd, MonoMethod **managed_method_ptr, CGRect p0, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	CGRect res = {{0}};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(CGRect *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_54 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	MonoObject *del2 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	if (p2) {
		del2 = xamarin_get_delegate_for_block_parameter (managed_method, 0xBB /* System.Action`1<WebKit.WKNavigationActionPolicy> ObjCRuntime.Trampolines/NIDActionArity1V279::Create(System.IntPtr) */ , 2, p2, &exception_gchandle);
		arg_ptrs [2] = del2;
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	} else {
		arg_ptrs [2] = NULL;
	}

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&del2);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_55 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	MonoObject *del2 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	if (p2) {
		del2 = xamarin_get_delegate_for_block_parameter (managed_method, 0xBD /* System.Action`1<WebKit.WKNavigationResponsePolicy> ObjCRuntime.Trampolines/NIDActionArity1V280::Create(System.IntPtr) */ , 2, p2, &exception_gchandle);
		arg_ptrs [2] = del2;
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	} else {
		arg_ptrs [2] = NULL;
	}

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&del2);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static float native_to_managed_trampoline_56 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	float res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(float *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_57 (id self, SEL _cmd, MonoMethod **managed_method_ptr, float p0, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &p0;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static NSUInteger native_to_managed_trampoline_58 (id self, SEL _cmd, MonoMethod **managed_method_ptr, uint32_t token_ref)
{
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	NSUInteger res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [0];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(NSUInteger *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_59 (id self, SEL _cmd, MonoMethod **managed_method_ptr, NSInteger p0, id p1, uint32_t token_ref)
{
	long long nativeEnum0 = p0;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &nativeEnum0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_60 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoArray *marr1 = NULL;
	NSArray *arr1 = NULL;
	MonoType *paramtype1 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arr1 = p1;
	xamarin_check_objc_type (p1, [NSArray class], _cmd, self, 1, managed_method);
	paramtype1 = xamarin_get_parameter_type (managed_method, 1);
	marr1 = xamarin_nsarray_to_managed_nsobject_array (arr1, paramtype1, NULL, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [1] = marr1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&marr1);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_61 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, void * p3, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoClass *paramclass2 = NULL;
	void * a3 = p3;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
		paramclass2 = mono_class_from_mono_type (paramtype2);
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, paramclass2, managed_method);
	}
	arg_ptrs [2] = mobj2;
	arg_ptrs [3] = &a3;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&paramclass2);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_62 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, unsigned int p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static id native_to_managed_trampoline_63 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	if (!retval) {
		res = NULL;
	} else {
		res = xamarin_string_to_nsstring ((MonoString *) retval, false);
	}

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_64 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, NSInteger p1, id p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	long long nativeEnum1 = p1;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoClass *paramclass2 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &nativeEnum1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
		paramclass2 = mono_class_from_mono_type (paramtype2);
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, paramclass2, managed_method);
	}
	arg_ptrs [2] = mobj2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&paramclass2);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_65 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;

	mono_runtime_invoke (managed_method, NULL, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void * native_to_managed_trampoline_66 (id self, SEL _cmd, MonoMethod **managed_method_ptr, void * p0, void * p1, uint32_t token_ref)
{
	void * a0 = p0;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	void * res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &a0;
	arg_ptrs [1] = &p1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(void * *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static BOOL native_to_managed_trampoline_67 (id self, SEL _cmd, MonoMethod **managed_method_ptr, void ** p0, void ** p1, uint32_t token_ref)
{
	void ** a0 = 0;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &a0;
	arg_ptrs [1] = p1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	*p0 = a0;

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static BOOL native_to_managed_trampoline_68 (id self, SEL _cmd, MonoMethod **managed_method_ptr, NSUInteger p0, void * p1, void * p2, uint32_t token_ref)
{
	unsigned long long nativeEnum0 = p0;
	void * a1 = p1;
	void * a2 = p2;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [0] = &nativeEnum0;
	arg_ptrs [1] = &a1;
	arg_ptrs [2] = &a2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_69 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, CGRect* p1, id* p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoObject *mobj2 = NULL;
	MonoObject *mobj_out2 = NULL;
	NSObject *nsobj2 = NULL;
	MonoType *paramtype2 = NULL;
	MonoClass *paramclass2 = NULL;
	void * handle2 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = p1;
	if (p2 != NULL)
		nsobj2 = *(NSObject **) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr (nsobj2, false, paramtype2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the byref parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
		paramclass2 = mono_class_from_mono_type (paramtype2);
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, paramclass2, managed_method);
	}
	mobj_out2 = mobj2;
	arg_ptrs [2] = (int *) &mobj_out2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	if (mobj_out2 != NULL) {
		handle2 = xamarin_get_nsobject_handle (mobj_out2);
		xamarin_mono_object_release (&mobj_out2);
	}
	if (p2 != NULL)
		*p2 = (id) handle2;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&paramclass2);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_70 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoString *a1 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	a1 = xamarin_nsstring_to_string (NULL, p1);
	arg_ptrs [1] = a1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&a1);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_71 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, NSInteger p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	long long nativeEnum1 = p1;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &nativeEnum1;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_72 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, CGFloat p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	arg_ptrs [2] = &p2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static id native_to_managed_trampoline_73 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, NSRange p1, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	id res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [2];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arg_ptrs [1] = &p1;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = xamarin_managed_nsobject_array_to_nsarray ((MonoArray *) retval, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	xamarin_framework_peer_waypoint ();
	mt_dummy_use (retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static BOOL native_to_managed_trampoline_74 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, NSRange p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	arg_ptrs [2] = &p2;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static BOOL native_to_managed_trampoline_75 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, NSRange p2, NSInteger p3, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	long long nativeEnum3 = p3;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	arg_ptrs [2] = &p2;
	arg_ptrs [3] = &nativeEnum3;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static BOOL native_to_managed_trampoline_76 (id self, SEL _cmd, MonoMethod **managed_method_ptr, SEL p0, uint32_t token_ref)
{
	MonoObject *a0 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	MonoObject *retval = NULL;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	BOOL res = {0};
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [1];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	a0 = p0 ? xamarin_get_selector (p0, &exception_gchandle) : NULL;
	arg_ptrs [0] = a0;
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;

	retval = mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

	res = *(BOOL *) mono_object_unbox ((MonoObject *) retval);

exception_handling:
	xamarin_mono_object_release (&a0);
	xamarin_mono_object_release (&retval);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return res;
}


static void native_to_managed_trampoline_77 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, BOOL p2, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	MonoArray *marr1 = NULL;
	NSArray *arr1 = NULL;
	MonoType *paramtype1 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [3];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	arr1 = p1;
	xamarin_check_objc_type (p1, [NSArray class], _cmd, self, 1, managed_method);
	paramtype1 = xamarin_get_parameter_type (managed_method, 1);
	marr1 = xamarin_nsarray_to_managed_nsobject_array (arr1, paramtype1, NULL, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	arg_ptrs [1] = marr1;
	arg_ptrs [2] = &p2;

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&marr1);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_78 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, id p3, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoClass *paramclass2 = NULL;
	MonoObject *del3 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
		paramclass2 = mono_class_from_mono_type (paramtype2);
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, paramclass2, managed_method);
	}
	arg_ptrs [2] = mobj2;
	if (p3) {
		del3 = xamarin_get_delegate_for_block_parameter (managed_method, 0x4AF /* System.Action`1<Foundation.NSUrlSessionResponseDisposition> ObjCRuntime.Trampolines/NIDActionArity1V67::Create(System.IntPtr) */ , 3, p3, &exception_gchandle);
		arg_ptrs [3] = del3;
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	} else {
		arg_ptrs [3] = NULL;
	}

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&paramclass2);
	xamarin_mono_object_release (&del3);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_79 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, id p3, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoClass *paramclass2 = NULL;
	MonoObject *del3 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
		paramclass2 = mono_class_from_mono_type (paramtype2);
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, paramclass2, managed_method);
	}
	arg_ptrs [2] = mobj2;
	if (p3) {
		del3 = xamarin_get_delegate_for_block_parameter (managed_method, 0x4B7 /* System.Action`1<Foundation.NSCachedUrlResponse> ObjCRuntime.Trampolines/NIDActionArity1V65::Create(System.IntPtr) */ , 3, p3, &exception_gchandle);
		arg_ptrs [3] = del3;
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	} else {
		arg_ptrs [3] = NULL;
	}

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&paramclass2);
	xamarin_mono_object_release (&del3);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_80 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, id p3, id p4, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoClass *paramclass2 = NULL;
	NSObject *nsobj3 = NULL;
	MonoObject *mobj3 = NULL;
	int32_t created3 = false;
	MonoType *paramtype3 = NULL;
	MonoClass *paramclass3 = NULL;
	MonoObject *del4 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [5];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
		paramclass2 = mono_class_from_mono_type (paramtype2);
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, paramclass2, managed_method);
	}
	arg_ptrs [2] = mobj2;
	nsobj3 = (NSObject *) p3;
	if (nsobj3) {
		paramtype3 = xamarin_get_parameter_type (managed_method, 3);
		mobj3 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj3, false, paramtype3, &created3, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype3, 3, true);
			goto exception_handling;
		}
		paramclass3 = mono_class_from_mono_type (paramtype3);
		xamarin_verify_parameter (mobj3, _cmd, self, nsobj3, 3, paramclass3, managed_method);
	}
	arg_ptrs [3] = mobj3;
	if (p4) {
		del4 = xamarin_get_delegate_for_block_parameter (managed_method, 0x4BB /* System.Action`1<Foundation.NSUrlRequest> ObjCRuntime.Trampolines/NIDActionArity1V3::Create(System.IntPtr) */ , 4, p4, &exception_gchandle);
		arg_ptrs [4] = del4;
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	} else {
		arg_ptrs [4] = NULL;
	}

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&paramclass2);
	xamarin_mono_object_release (&paramtype3);
	xamarin_mono_object_release (&mobj3);
	xamarin_mono_object_release (&paramclass3);
	xamarin_mono_object_release (&del4);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}


static void native_to_managed_trampoline_81 (id self, SEL _cmd, MonoMethod **managed_method_ptr, id p0, id p1, id p2, id p3, uint32_t token_ref)
{
	NSObject *nsobj0 = NULL;
	MonoObject *mobj0 = NULL;
	int32_t created0 = false;
	MonoType *paramtype0 = NULL;
	MonoClass *paramclass0 = NULL;
	NSObject *nsobj1 = NULL;
	MonoObject *mobj1 = NULL;
	int32_t created1 = false;
	MonoType *paramtype1 = NULL;
	MonoClass *paramclass1 = NULL;
	NSObject *nsobj2 = NULL;
	MonoObject *mobj2 = NULL;
	int32_t created2 = false;
	MonoType *paramtype2 = NULL;
	MonoClass *paramclass2 = NULL;
	MonoObject *del3 = NULL;
	MonoObject *exception = NULL;
	MonoObject **exception_ptr = xamarin_is_managed_exception_marshaling_disabled () ? NULL : &exception;
	GCHandle exception_gchandle = INVALID_GCHANDLE;
	MonoMethod *managed_method = *managed_method_ptr;
	void *arg_ptrs [4];
	MonoReflectionMethod *reflection_method = NULL;
	MONO_ASSERT_GC_SAFE_OR_DETACHED;
	MONO_THREAD_ATTACH;

	MonoObject *mthis = NULL;
	if (self) {
		mthis = xamarin_get_managed_object_for_ptr_fast (self, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	}
	if (!managed_method) {
		GCHandle reflection_method_handle = xamarin_get_method_from_token (token_ref, &exception_gchandle);
		reflection_method = (MonoReflectionMethod *) xamarin_gchandle_unwrap (reflection_method_handle);
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
		managed_method = xamarin_get_reflection_method_method (reflection_method);
		*managed_method_ptr = managed_method;
		xamarin_mono_object_release_at_process_exit (managed_method);
	}
	xamarin_check_for_gced_object (mthis, _cmd, self, managed_method, &exception_gchandle);
	if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	nsobj0 = (NSObject *) p0;
	if (nsobj0) {
		paramtype0 = xamarin_get_parameter_type (managed_method, 0);
		mobj0 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj0, false, paramtype0, &created0, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype0, 0, true);
			goto exception_handling;
		}
		paramclass0 = mono_class_from_mono_type (paramtype0);
		xamarin_verify_parameter (mobj0, _cmd, self, nsobj0, 0, paramclass0, managed_method);
	}
	arg_ptrs [0] = mobj0;
	nsobj1 = (NSObject *) p1;
	if (nsobj1) {
		paramtype1 = xamarin_get_parameter_type (managed_method, 1);
		mobj1 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj1, false, paramtype1, &created1, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype1, 1, true);
			goto exception_handling;
		}
		paramclass1 = mono_class_from_mono_type (paramtype1);
		xamarin_verify_parameter (mobj1, _cmd, self, nsobj1, 1, paramclass1, managed_method);
	}
	arg_ptrs [1] = mobj1;
	nsobj2 = (NSObject *) p2;
	if (nsobj2) {
		paramtype2 = xamarin_get_parameter_type (managed_method, 2);
		mobj2 = xamarin_get_nsobject_with_type_for_ptr_created (nsobj2, false, paramtype2, &created2, &exception_gchandle);
		if (exception_gchandle != INVALID_GCHANDLE) {
			exception_gchandle = xamarin_get_exception_for_parameter (8029, exception_gchandle, "Unable to marshal the parameter", _cmd, managed_method, paramtype2, 2, true);
			goto exception_handling;
		}
		paramclass2 = mono_class_from_mono_type (paramtype2);
		xamarin_verify_parameter (mobj2, _cmd, self, nsobj2, 2, paramclass2, managed_method);
	}
	arg_ptrs [2] = mobj2;
	if (p3) {
		del3 = xamarin_get_delegate_for_block_parameter (managed_method, 0x4BF /* System.Action`2<Foundation.NSUrlSessionAuthChallengeDisposition,Foundation.NSUrlCredential> ObjCRuntime.Trampolines/NIDActionArity2V11::Create(System.IntPtr) */ , 3, p3, &exception_gchandle);
		arg_ptrs [3] = del3;
		if (exception_gchandle != INVALID_GCHANDLE) goto exception_handling;
	} else {
		arg_ptrs [3] = NULL;
	}

	mono_runtime_invoke (managed_method, mthis, arg_ptrs, exception_ptr);
	if (exception != NULL) goto exception_handling;

exception_handling:
	xamarin_mono_object_release (&paramtype0);
	xamarin_mono_object_release (&mobj0);
	xamarin_mono_object_release (&paramclass0);
	xamarin_mono_object_release (&paramtype1);
	xamarin_mono_object_release (&mobj1);
	xamarin_mono_object_release (&paramclass1);
	xamarin_mono_object_release (&paramtype2);
	xamarin_mono_object_release (&mobj2);
	xamarin_mono_object_release (&paramclass2);
	xamarin_mono_object_release (&del3);
	xamarin_mono_object_release (&mthis);
	xamarin_mono_object_release (&reflection_method);

	MONO_THREAD_DETACH;
	if (exception_gchandle != INVALID_GCHANDLE)
		xamarin_process_managed_exception_gchandle (exception_gchandle);
	xamarin_process_managed_exception (exception);
	return;
}




#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__UIKit_UIApplicationDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x5);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@interface Microsoft_Maui_MauiUIApplicationDelegate : NSObject<UIApplicationDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Microsoft_Maui_MauiUIApplicationDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}

	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x502);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface __UnoHotRestartDelegate : Microsoft_Maui_MauiUIApplicationDelegate<UIApplicationDelegate> {
}
	-(BOOL) application:(UIApplication *)p0 didFinishLaunchingWithOptions:(NSDictionary *)p1;
	-(id) init;
@end

@implementation __UnoHotRestartDelegate {
}

	-(BOOL) application:(UIApplication *)p0 didFinishLaunchingWithOptions:(NSDictionary *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, p1, 0x202);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x302);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_Maui_MauiUIApplicationDelegate class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Controls_BindableUIView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) didAddSubview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xC6FF9C);
	}

	-(void) addSubview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xC7019C);
	}

	-(void) insertSubview:(UIView *)p0 atIndex:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_4 (self, _cmd, &managed_method, p0, p1, 0xC7029C);
	}

	-(void) willRemoveSubview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xC7039C);
	}

	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC7209C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xC7219C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC7049C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_UIElement {
}

	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x9F69C);
	}

	-(BOOL) isHidden
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x9FB9C);
	}

	-(void) setHidden:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0x9FC9C);
	}

	-(void) touchesBegan:(NSSet *)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0xA9C9C);
	}

	-(void) touchesMoved:(NSSet *)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0xA9E9C);
	}

	-(void) touchesEnded:(NSSet *)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0xAA09C);
	}

	-(void) touchesCancelled:(NSSet *)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0xAA29C);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x9F59C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Uno_UI_Controls_BindableUIView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_FrameworkElement {
}

	-(void) setNeedsLayout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5B89C);
	}

	-(void) layoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5B99C);
	}

	-(CGSize) sizeThatFits:(CGSize)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, p0, 0x5BA9C);
	}

	-(void) addSubview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x5BB9C);
	}

	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5CB9C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x5CC9C);
	}

	-(CGRect) frame
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_10 (self, _cmd, &managed_method, 0x5FB9C);
	}

	-(void) setFrame:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, 0x5FC9C);
	}

	-(void) didMoveToSuperview
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x6049C);
	}

	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_12 (self, _cmd, &managed_method, p0, p1, 0x6169C);
	}

	-(NSString *) getDependencyPropertyValue:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x6189C);
	}

	-(NSString *) setDependencyPropertyValue:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x6199C);
	}

	-(BOOL) accessibilityActivate
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x61F9C);
	}

	-(BOOL) isAccessibilityElement
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x6209C);
	}

	-(void) setIsAccessibilityElement:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0x6219C);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x5BD9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_UIElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Control {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2CCB9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ContentControl {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2AA69C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_UserControl {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x50969C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Page {
}

	-(void) layoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x3DAD9C);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3D969C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_UserControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Unoapp1_SplashScreen {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x1302);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Page class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation UnoAppDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(BOOL) application:(UIApplication *)p0 didFinishLaunchingWithOptions:(NSDictionary *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, p1, 0x43A9C);
	}

	-(BOOL) application:(UIApplication *)p0 continueUserActivity:(NSUserActivity *)p1 restorationHandler:(void (^)(id *))p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_14 (self, _cmd, &managed_method, p0, p1, p2, 0x43B9C);
	}

	-(void) application:(UIApplication *)p0 didUpdateUserActivity:(NSUserActivity *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x43C9C);
	}

	-(BOOL) application:(UIApplication *)p0 openURL:(NSURL *)p1 options:(NSDictionary *)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_15 (self, _cmd, &managed_method, p0, p1, p2, 0x43D9C);
	}

	-(void) application:(UIApplication *)p0 performActionForShortcutItem:(UIApplicationShortcutItem *)p1 completionHandler:(void (^)(BOOL))p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_16 (self, _cmd, &managed_method, p0, p1, p2, 0x43E9C);
	}

	-(NSUInteger) application:(UIApplication *)p0 supportedInterfaceOrientationsForWindow:(UIWindow *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_17 (self, _cmd, &managed_method, p0, p1, 0x4409C);
	}

	-(NSString *) getApplicationDataPath
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_18 (self, _cmd, &managed_method, 0x4419C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4019C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation UnoApp1_App {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x100302);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UnoAppDelegate class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation UnoApp1_Pages_Registration_RegisterHomePage {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x100D02);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Page class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation UnoApp1_Pages_Control_HomeControlPage {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x103402);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Page class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation UnoApp1_Pages_Authentication_EmailConfirmationPage {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x105102);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Page class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation UnoApp1_Pages_Authentication_LoginPage {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x107902);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Page class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation UnoApp1_Pages_Authentication_SignUpPage {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x10A702);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Page class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation SkiaSharp_Views_Windows_SKSwapChainPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x1C3A);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Panel {
}

	-(void) didAddSubview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x3DE99C);
	}

	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_12 (self, _cmd, &managed_method, p0, p1, 0x3DEC9C);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3DB89C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Canvas {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x27D99C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation SkiaSharp_Views_Windows_SKXamlCanvas {
}

	-(void) drawRect:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, 0x3F3A);
	}

	-(void) willMoveToWindow:(UIWindow *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x403A);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3D3A);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Canvas class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface SkiaSharp_Views_Windows_SKGLView : GLKView<GLKViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) awakeFromNib;
	-(void) glkView:(GLKView *)p0 drawInRect:(CGRect)p1;
	-(CGRect) frame;
	-(void) setFrame:(CGRect)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation SkiaSharp_Views_Windows_SKGLView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) awakeFromNib
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x613A);
	}

	-(void) glkView:(GLKView *)p0 drawInRect:(CGRect)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_19 (self, _cmd, &managed_method, p0, p1, 0x653A);
	}

	-(CGRect) frame
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_10 (self, _cmd, &managed_method, 0x6A3A);
	}

	-(void) setFrame:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, 0x6B3A);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x5E3A);
		if (call_super && rv) {
			struct objc_super super = {  rv, [GLKView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Material_Ripple {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x16A);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__UIKit_UIScrollViewDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2F);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@interface Uno_Toolkit_UI_ScrollViewDelegate : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) scrollViewDidScroll:(UIScrollView *)p0;
	-(void) scrollViewDidEndDecelerating:(UIScrollView *)p0;
	-(void) scrollViewDidEndDragging:(UIScrollView *)p0 willDecelerate:(BOOL)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Uno_Toolkit_UI_ScrollViewDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) scrollViewDidScroll:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x7070);
	}

	-(void) scrollViewDidEndDecelerating:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x7170);
	}

	-(void) scrollViewDidEndDragging:(UIScrollView *)p0 willDecelerate:(BOOL)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, p1, 0x7270);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_CardContentControl {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC270);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_Card {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xCD70);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_ButtonBase {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x658C9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_ToggleButton {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6F799C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_ButtonBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_Chip {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x10670);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_ToggleButton class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_Divider {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x18570);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_DrawerControl {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x18A70);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Border {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x24A69C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_Toolkit_UI_AppBarButtonWrapper : Microsoft_UI_Xaml_Controls_Border {
}
	-(void) didMoveToSuperview;
	-(id) init;
@end

@implementation Uno_Toolkit_UI_AppBarButtonWrapper {
}

	-(void) didMoveToSuperview
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x29870);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x29770);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Border class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_Toolkit_UI_TitleView : Microsoft_UI_Xaml_Controls_Border {
}
	-(void) didMoveToSuperview;
	-(CGRect) frame;
	-(void) setFrame:(CGRect)p0;
	-(id) init;
@end

@implementation Uno_Toolkit_UI_TitleView {
}

	-(void) didMoveToSuperview
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x38870);
	}

	-(CGRect) frame
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_10 (self, _cmd, &managed_method, 0x38C70);
	}

	-(void) setFrame:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, 0x38D70);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x38970);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Border class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_Toolkit_UI_SafeAreaPresenter : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@implementation Uno_Toolkit_UI_SafeAreaPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x46870);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_SelectorItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6ED99C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_TabBarItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4B370);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_SelectorItem class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_RelativePanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x41D99C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_AutoLayout {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x9F70);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_RelativePanel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ItemsControl {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x32A59C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_ChipGroup {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x12870);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ItemsControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_DrawerFlyoutPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x1D770);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_LoadingView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x27870);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_ExtendedSplashScreen {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x22D70);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Uno_Toolkit_UI_LoadingView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_CompositeLoadableSource {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x23F70);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_LoadableSource {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x25D70);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_Toolkit_UI_NativeFramePresenter_PageViewController : UIViewController {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) viewDidAppear:(BOOL)p0;
	-(void) viewWillAppear:(BOOL)p0;
	-(void) viewWillDisappear:(BOOL)p0;
	-(void) viewDidDisappear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Uno_Toolkit_UI_NativeFramePresenter_PageViewController {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) viewDidAppear:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0x2CF70);
	}

	-(void) viewWillAppear:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0x2D070);
	}

	-(void) viewWillDisappear:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0x2D170);
	}

	-(void) viewDidDisappear:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0x2D270);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Uno_Toolkit_UI_NativeFramePresenter_FrameNavigationController : UINavigationController {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(UIViewController *) popViewControllerAnimated:(BOOL)p0;
	-(void) pushViewController:(UIViewController *)p0 animated:(BOOL)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Uno_Toolkit_UI_NativeFramePresenter_FrameNavigationController {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(UIViewController *) popViewControllerAnimated:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_21 (self, _cmd, &managed_method, p0, 0x2D970);
	}

	-(void) pushViewController:(UIViewController *)p0 animated:(BOOL)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, p1, 0x2DA70);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2D870);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UINavigationController class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__UIKit_UINavigationControllerDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3B);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@interface Uno_Toolkit_UI_NativeFramePresenter_ControllerDelegate : NSObject<UINavigationControllerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) navigationController:(UINavigationController *)p0 willShowViewController:(UIViewController *)p1 animated:(BOOL)p2;
	-(void) navigationController:(UINavigationController *)p0 didShowViewController:(UIViewController *)p1 animated:(BOOL)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Uno_Toolkit_UI_NativeFramePresenter_ControllerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) navigationController:(UINavigationController *)p0 willShowViewController:(UIViewController *)p1 animated:(BOOL)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, p2, 0x2DD70);
	}

	-(void) navigationController:(UINavigationController *)p0 didShowViewController:(UIViewController *)p1 animated:(BOOL)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, p2, 0x2DE70);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_NativeFramePresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2A270);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ContentPresenter {
}

	-(void) layoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x2BFF9C);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2B7C9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_NativeNavigationBarPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2ED70);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentPresenter class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_NavigationBar {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x30570);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_NavigationBarPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x39170);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_ResponsiveView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3FE70);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_SafeArea {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x42B70);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_TabBar {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x46E70);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ItemsControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_TabBarListPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4E370);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Toolkit_UI_TabBarSelectionIndicatorPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4EF70);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_BaseToolWindowControl : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_BaseToolWindowControl {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x1578);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_Controls_ShadowControl : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_Controls_ShadowControl {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x25178);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_Client_Core_Controls_DataTemplateBreadcrumb : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_Client_Core_Controls_DataTemplateBreadcrumb {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC4E78);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_Client_Controls_HDMessage : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_Client_Controls_HDMessage {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x7EE7A);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_Client_Controls_ShellControlPanel : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_Client_Controls_ShellControlPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x8157A);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_Client_Controls_ShellToolbarMenu : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_Client_Controls_ShellToolbarMenu {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x8377A);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_Client_HotDesignClientHost : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_Client_HotDesignClientHost {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC47A);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_Client_HotReload_HotReloadStatusView : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_Client_HotReload_HotReloadStatusView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x7207A);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_Client_Controls_Adornment : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_Client_Controls_Adornment {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x73B7A);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_Client_Controls_DataTemplateEditor : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_Client_Controls_DataTemplateEditor {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x7767A);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_Client_Controls_DesignerOverlay : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_Client_Controls_DesignerOverlay {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x7847A);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_Client_Controls_EntryButton : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_Client_Controls_EntryButton {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x7E97A);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_Client_Controls_ZoomContentControl : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_Client_Controls_ZoomContentControl {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x8BD7A);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_Client_Adorners_AdornersLayer : Microsoft_UI_Xaml_Controls_Canvas {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_Client_Adorners_AdornersLayer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x9647A);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Canvas class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_CommunityToolkit_Controls_SizerBase : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_CommunityToolkit_Controls_SizerBase {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xB87C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Grid {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2FEC9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_CommunityToolkit_Controls_UniformGrid : Microsoft_UI_Xaml_Controls_Grid {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_CommunityToolkit_Controls_UniformGrid {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x8D7C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Grid class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_CommunityToolkit_Controls_GridSplitter : Uno_UI_HotDesign_CommunityToolkit_Controls_SizerBase {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_CommunityToolkit_Controls_GridSplitter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xB07C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Uno_UI_HotDesign_CommunityToolkit_Controls_SizerBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_Hierarchy_HierarchyView : Uno_UI_HotDesign_BaseToolWindowControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_Hierarchy_HierarchyView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xD7E);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Uno_UI_HotDesign_BaseToolWindowControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_PropertyGrid_PropertySearchBar : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_PropertyGrid_PropertySearchBar {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x21782);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_PropertyGrid_SelectionBreadcrumb : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_PropertyGrid_SelectionBreadcrumb {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x23282);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_PropertyGrid_AdvancedPropertyEditor : Microsoft_UI_Xaml_Controls_UserControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_PropertyGrid_AdvancedPropertyEditor {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4B82);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_UserControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_PropertyGrid_CollectionEditor : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_PropertyGrid_CollectionEditor {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x1E882);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_PropertyGrid_IdentityProperties : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_PropertyGrid_IdentityProperties {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x1F182);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_PropertyGrid_SelectionProperties : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_PropertyGrid_SelectionProperties {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x23F82);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ContentDialog {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2ADB9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_PropertyGrid_PropertyFlyout : Microsoft_UI_Xaml_Controls_ContentDialog {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_PropertyGrid_PropertyFlyout {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3AD82);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentDialog class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_PropertyGrid_PropertyGridCell : Microsoft_UI_Xaml_Controls_UserControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_PropertyGrid_PropertyGridCell {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x42B82);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_UserControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_PropertyGrid_PropertyGridView : Uno_UI_HotDesign_BaseToolWindowControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_PropertyGrid_PropertyGridView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4CB82);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Uno_UI_HotDesign_BaseToolWindowControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_PropertyGrid_Editors_CornerRadiusEditor : Microsoft_UI_Xaml_Controls_UserControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_PropertyGrid_Editors_CornerRadiusEditor {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x7DD82);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_UserControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_PropertyGrid_Editors_GridDefinitionsEditor : Microsoft_UI_Xaml_Controls_UserControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_PropertyGrid_Editors_GridDefinitionsEditor {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x7F682);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_UserControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_HotDesign_Toolbox_ToolboxView : Uno_UI_HotDesign_BaseToolWindowControl {
}
	-(id) init;
@end

@implementation Uno_UI_HotDesign_Toolbox_ToolboxView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4084);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Uno_UI_HotDesign_BaseToolWindowControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Toolkit_ElevatedView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x7E9A);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Diagnostics_UI_DiagnosticsOverlay {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x209A);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Microsoft_UI_Xaml_DragRoot : Microsoft_UI_Xaml_Controls_Canvas {
}
	-(id) init;
@end

@implementation Microsoft_UI_Xaml_DragRoot {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xEE39C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Canvas class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Microsoft_UI_Xaml_DragView : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@implementation Microsoft_UI_Xaml_DragView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xF009C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Shapes_Shape {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x11AE9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Shapes_Ellipse {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x11329C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Shapes_Shape class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Shapes_Line {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x11469C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Shapes_Shape class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Shapes_Path {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x11519C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Shapes_Shape class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Shapes_Rectangle {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x11809C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Shapes_Shape class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Documents_Glyphs {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x154F9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_AnimatedVisualPlayer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x22A39C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_AnnotatedScrollBar {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x22B49C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_AppBarElementContainer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x237F9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_AppBarSeparator {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x23839C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_AppBarToggleButton {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x239B9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_ToggleButton class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Button {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x257F9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_ButtonBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_CheckBox {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x27F89C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_ToggleButton class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ComboBoxItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2A069C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_SelectorItem class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_DatePickerFlyoutPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2E589C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_DropDownButton {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2E839C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Button class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_Selector {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6E769C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ItemsControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_FlipView {
}

	-(void) layoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x2EE69C);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2EDF9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_Selector class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_FlipViewItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2EF79C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_SelectorItem class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_FlyoutPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2F0F9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ListViewBase {
}

	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x36F39C);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x367A9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_Selector class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_GridView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x306A9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ListViewBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ListViewBaseHeaderItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x375E9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_GridViewHeaderItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x30719C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ListViewBaseHeaderItem class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_GridViewItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x30759C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_SelectorItem class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_GroupItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x307B9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Hub {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x309D9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_HubSection {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x30B99C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_IconElement {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x58969C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ImageIcon {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x31659C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_IconElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_InfoBadge {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x31799C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_InfoBar {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x31AC9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ListBox {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x362A9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_Selector class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ListBoxItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x36309C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_SelectorItem class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ListPickerFlyoutPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x363F9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ListView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x36439C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ListViewBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ListViewHeaderItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x37649C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ListViewBaseHeaderItem class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ListViewItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x37689C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_SelectorItem class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_MapControl {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x377D9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_MenuBar {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x392D9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_MenuFlyoutItemBase {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x39D59C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_MenuFlyoutSeparator {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3A0C9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_MenuFlyoutItemBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_NavigationViewItemBase {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3CA19C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_NavigationViewItemHeader {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3CA99C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_NavigationViewItemBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_NavigationViewItemSeparator {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3CB89C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_NavigationViewItemBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ParallaxView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3E1A9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_PersonPicture {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3E779C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_PickerFlyoutPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3EE99C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_PivotItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3FB69C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_RangeBase {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6C2B9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ProgressBar {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3FD19C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_RangeBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_RadioButton {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x405E9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_ToggleButton class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_RefreshVisualizer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x41A59C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_ListViewItemPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6A399C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentPresenter class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_RevealListViewItemPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x42619C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_ListViewItemPresenter class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_RichEditBox {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x42C79C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_RichTextBlock {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x432F9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_RichTextBlockOverflow {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x434B9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ScrollContentPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x43C99C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentPresenter class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_SelectorBar {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x46469C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ItemContainer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x325A9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_SelectorBarItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x465D9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ItemContainer class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_SemanticZoom {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x467C9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_SwapChainBackgroundPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x48249C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Grid class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_SwapChainPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x482C9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Grid class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_TabViewItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x49E29C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ListViewItem class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_TimePickerFlyoutPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4DF69C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_FlyoutPresenter class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_SplitButton {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x46FA9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ToggleSplitButton {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4E339C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_SplitButton class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ToolTip {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4EA29C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_TreeView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4EEE9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Viewbox {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x50DD9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_VirtualizingPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x510B9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_OrientedVirtualizingPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6B8E9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_VirtualizingPanel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_VirtualizingStackPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x511A9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_OrientedVirtualizingPanel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_WrapGrid {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x516E9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_OrientedVirtualizingPanel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_TextBlock {
}

	-(void) drawRect:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, 0x4BF89C);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4B889C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ImplicitTextBlock {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x57C19C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_TextBlock class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_PopupPanel : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_PopupPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x70439C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Microsoft_UI_Xaml_Controls_ContentDialogPopupPanel : Microsoft_UI_Xaml_Controls_Primitives_PopupPanel {
}
@end

@implementation Microsoft_UI_Xaml_Controls_ContentDialogPopupPanel {
}
@end

@interface Microsoft_UI_Xaml_Controls_NativeDatePickerFlyoutPresenter : Microsoft_UI_Xaml_Controls_FlyoutPresenter {
}
	-(id) init;
@end

@implementation Microsoft_UI_Xaml_Controls_NativeDatePickerFlyoutPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x58319C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_FlyoutPresenter class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__UIKit_UICollectionViewSource {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x47);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@implementation Microsoft_UI_Xaml_Controls_FlipViewSource {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(UICollectionViewCell *) collectionView:(UICollectionView *)p0 cellForItemAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, 0x58429C);
	}

	-(void *) collectionView:(UICollectionView *)p0 numberOfItemsInSection:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_24 (self, _cmd, &managed_method, p0, p1, 0x58439C);
	}

	-(void *) numberOfSectionsInCollectionView:(UICollectionView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_25 (self, _cmd, &managed_method, p0, 0x58449C);
	}

	-(void) scrollViewDidEndDragging:(UIScrollView *)p0 willDecelerate:(BOOL)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, p1, 0x58459C);
	}

	-(void) scrollViewDidEndDecelerating:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x58469C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x583F9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_PagedCollectionView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) layoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x584D9C);
	}

	-(CGSize) contentSize
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_26 (self, _cmd, &managed_method, 0x58529C);
	}

	-(void) setContentSize:(CGSize)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_27 (self, _cmd, &managed_method, p0, 0x58539C);
	}

	-(BOOL) isDragging
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x58569C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x584C9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UICollectionView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_NativeFlipView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x58499C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_PagedCollectionView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Microsoft_UI_Xaml_Controls_FlyoutBasePopupPanel : Microsoft_UI_Xaml_Controls_Primitives_PopupPanel {
}
@end

@implementation Microsoft_UI_Xaml_Controls_FlyoutBasePopupPanel {
}
@end

@interface Microsoft_UI_Xaml_Controls_PickerFlyoutPopupPanel : Microsoft_UI_Xaml_Controls_FlyoutBasePopupPanel {
}
@end

@implementation Microsoft_UI_Xaml_Controls_PickerFlyoutPopupPanel {
}
@end

@interface Microsoft_UI_Xaml_Controls_NativeImageView : UIImageView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Microsoft_UI_Xaml_Controls_NativeImageView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}

	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x58B29C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIImageView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_VirtualizingPanelLayout {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(NSArray *) layoutAttributesForElementsInRect:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_28 (self, _cmd, &managed_method, p0, 0x5C369C);
	}

	-(UICollectionViewLayoutAttributes *) layoutAttributesForItemAtIndexPath:(NSIndexPath *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x5C379C);
	}

	-(UICollectionViewLayoutAttributes *) layoutAttributesForSupplementaryViewOfKind:(NSString *)p0 atIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, 0x5C389C);
	}

	-(CGSize) collectionViewContentSize
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_26 (self, _cmd, &managed_method, 0x5C399C);
	}

	-(void) prepareLayout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5C3B9C);
	}

	-(void) prepareForCollectionViewUpdates:(NSArray *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_29 (self, _cmd, &managed_method, p0, 0x5C3C9C);
	}

	-(void) finalizeCollectionViewUpdates
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5C3D9C);
	}

	-(UICollectionViewLayoutAttributes *) initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x5C3E9C);
	}

	-(UICollectionViewLayoutAttributes *) finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x5C3F9C);
	}

	-(BOOL) shouldInvalidateLayoutForBoundsChange:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_30 (self, _cmd, &managed_method, p0, 0x5C509C);
	}

	-(void) invalidateLayout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5C529C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x5C359C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UICollectionViewLayout class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Microsoft_UI_Xaml_Controls_ItemsStackPanelLayout : Microsoft_UI_Xaml_Controls_VirtualizingPanelLayout {
}
	-(id) init;
@end

@implementation Microsoft_UI_Xaml_Controls_ItemsStackPanelLayout {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x58BC9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_VirtualizingPanelLayout class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ListViewBaseScrollContentPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x59539C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ScrollContentPresenter class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Microsoft_UI_Xaml_Controls_ListViewBaseInternalContainer : UICollectionViewCell {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(CGRect) frame;
	-(void) setFrame:(CGRect)p0;
	-(CGRect) bounds;
	-(void) setBounds:(CGRect)p0;
	-(UICollectionViewLayoutAttributes *) preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)p0;
	-(void) layoutSubviews;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Microsoft_UI_Xaml_Controls_ListViewBaseInternalContainer {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(CGRect) frame
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_10 (self, _cmd, &managed_method, 0x59AC9C);
	}

	-(void) setFrame:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, 0x59AD9C);
	}

	-(CGRect) bounds
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_10 (self, _cmd, &managed_method, 0x59AE9C);
	}

	-(void) setBounds:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, 0x59AF9C);
	}

	-(UICollectionViewLayoutAttributes *) preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x59B39C);
	}

	-(void) layoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x59B59C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x599F9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UICollectionViewCell class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Microsoft_UI_Xaml_Controls_BlockLayout : Microsoft_UI_Xaml_Controls_Border {
}
	-(void) setNeedsLayout;
	-(id) init;
@end

@implementation Microsoft_UI_Xaml_Controls_BlockLayout {
}

	-(void) setNeedsLayout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x59BC9C);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x59BE9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Border class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_UnsetLayout {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x5BF19C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_VirtualizingPanelLayout class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_NativePage {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}

	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x5D4A9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIViewController class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_PickerItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x5EB99C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_SelectorItem class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__UIKit_UIPickerViewModel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x5F);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@implementation Microsoft_UI_Xaml_Controls_PickerModel {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(NSString *) pickerView:(UIPickerView *)p0 titleForRow:(void *)p1 forComponent:(void *)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_31 (self, _cmd, &managed_method, p0, p1, p2, 0x5EBE9C);
	}

	-(void *) numberOfComponentsInPickerView:(UIPickerView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_25 (self, _cmd, &managed_method, p0, 0x5EBF9C);
	}

	-(void *) pickerView:(UIPickerView *)p0 numberOfRowsInComponent:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_24 (self, _cmd, &managed_method, p0, p1, 0x5EC09C);
	}

	-(CGFloat) pickerView:(UIPickerView *)p0 rowHeightForComponent:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_32 (self, _cmd, &managed_method, p0, p1, 0x5EC19C);
	}

	-(CGFloat) pickerView:(UIPickerView *)p0 widthForComponent:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_32 (self, _cmd, &managed_method, p0, p1, 0x5EC29C);
	}

	-(UIView *) pickerView:(UIPickerView *)p0 viewForRow:(void *)p1 forComponent:(void *)p2 reusingView:(UIView *)p3
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_33 (self, _cmd, &managed_method, p0, p1, p2, p3, 0x5EC39C);
	}

	-(void) pickerView:(UIPickerView *)p0 didSelectRow:(void *)p1 inComponent:(void *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_34 (self, _cmd, &managed_method, p0, p1, p2, 0x5EC49C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_Popup {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6BD99C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_NativePopupBase {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x5EED9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_Popup class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Popover {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x5EDE9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_NativePopupBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__UIKit_UITextViewDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x67);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@implementation Microsoft_UI_Xaml_Controls_MultilineTextBoxDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) textViewDidChange:(UITextView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x60D29C);
	}

	-(void) textViewDidBeginEditing:(UITextView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x60D39C);
	}

	-(void) textViewDidEndEditing:(UITextView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x60D49C);
	}

	-(BOOL) textView:(UITextView *)p0 shouldChangeTextInRange:(NSRange)p1 replacementText:(NSString *)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_35 (self, _cmd, &managed_method, p0, p1, p2, 0x60D59C);
	}

	-(BOOL) textViewShouldEndEditing:(UITextView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_36 (self, _cmd, &managed_method, p0, 0x60D69C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Microsoft_UI_Xaml_Controls_NativeTimePickerFlyoutPresenter : Microsoft_UI_Xaml_Controls_FlyoutPresenter {
}
	-(id) init;
@end

@implementation Microsoft_UI_Xaml_Controls_NativeTimePickerFlyoutPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x63D59C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_FlyoutPresenter class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__WebKit_WKUIDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6F);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@interface Microsoft_UI_Xaml_Controls_LocalWKUIDelegate : NSObject<WKUIDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(WKWebView *) webView:(WKWebView *)p0 createWebViewWithConfiguration:(WKWebViewConfiguration *)p1 forNavigationAction:(WKNavigationAction *)p2 windowFeatures:(WKWindowFeatures *)p3;
	-(void) webView:(WKWebView *)p0 runJavaScriptAlertPanelWithMessage:(NSString *)p1 initiatedByFrame:(WKFrameInfo *)p2 completionHandler:(void (^)())p3;
	-(void) webView:(WKWebView *)p0 runJavaScriptTextInputPanelWithPrompt:(NSString *)p1 defaultText:(NSString *)p2 initiatedByFrame:(WKFrameInfo *)p3 completionHandler:(void (^)(void *))p4;
	-(void) webView:(WKWebView *)p0 runJavaScriptConfirmPanelWithMessage:(NSString *)p1 initiatedByFrame:(WKFrameInfo *)p2 completionHandler:(void (^)(void *))p3;
	-(void) webViewDidClose:(WKWebView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Microsoft_UI_Xaml_Controls_LocalWKUIDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(WKWebView *) webView:(WKWebView *)p0 createWebViewWithConfiguration:(WKWebViewConfiguration *)p1 forNavigationAction:(WKNavigationAction *)p2 windowFeatures:(WKWindowFeatures *)p3
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_37 (self, _cmd, &managed_method, p0, p1, p2, p3, 0x64099C);
	}

	-(void) webView:(WKWebView *)p0 runJavaScriptAlertPanelWithMessage:(NSString *)p1 initiatedByFrame:(WKFrameInfo *)p2 completionHandler:(void (^)())p3
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_38 (self, _cmd, &managed_method, p0, p1, p2, p3, 0x640A9C);
	}

	-(void) webView:(WKWebView *)p0 runJavaScriptTextInputPanelWithPrompt:(NSString *)p1 defaultText:(NSString *)p2 initiatedByFrame:(WKFrameInfo *)p3 completionHandler:(void (^)(void *))p4
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_39 (self, _cmd, &managed_method, p0, p1, p2, p3, p4, 0x640B9C);
	}

	-(void) webView:(WKWebView *)p0 runJavaScriptConfirmPanelWithMessage:(NSString *)p1 initiatedByFrame:(WKFrameInfo *)p2 completionHandler:(void (^)(void *))p3
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_40 (self, _cmd, &managed_method, p0, p1, p2, p3, 0x640C9C);
	}

	-(void) webViewDidClose:(WKWebView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x640D9C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_UnoWKWebView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) didChangeValueForKey:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_41 (self, _cmd, &managed_method, p0, 0x64289C);
	}

	-(BOOL) canGoBack
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x64299C);
	}

	-(BOOL) canGoForward
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x642A9C);
	}

	-(void) userContentController:(WKUserContentController *)p0 didReceiveScriptMessage:(WKScriptMessage *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x64359C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x64119C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [WKWebView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_NativeWebView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x640E9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_UnoWKWebView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_WindowView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) didMoveToSuperview
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x64AE9C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x64AC9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_WrapPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x64C99C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_StackPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x47EE9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_CarouselPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x66AA9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_StackPanel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Slider {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x468A9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_RangeBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_ColorPickerSlider {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x66AE9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Slider class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_AppBar {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x22C59C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_CommandBar {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2A169C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_AppBar class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_CommandBarFlyoutCommandBar {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x675A9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_CommandBar class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_GridViewItemPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x68EA9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentPresenter class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_InfoBarPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x690A9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_LoopingSelectorPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6AD89C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Canvas class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_MonochromaticOverlayPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6B229C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Grid class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_PivotHeaderItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6B9A9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_PivotHeaderPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6BA09C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Canvas class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_PivotPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6BAE9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_RepeatButton {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6C5C9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_ButtonBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_TabViewListView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6F3F9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ListView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_Thumb {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6F489C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_TickBar {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6F6F9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_Xaml_Islands_XamlIsland : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@implementation Uno_UI_Xaml_Islands_XamlIsland {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xBE2A9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_Xaml_Islands_XamlIslandRootCollection : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@implementation Uno_UI_Xaml_Islands_XamlIslandRootCollection {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xBE469C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_Xaml_Core_FullWindowMediaRoot : Microsoft_UI_Xaml_Controls_Border {
}
	-(id) init;
@end

@implementation Uno_UI_Xaml_Core_FullWindowMediaRoot {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xBEA09C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Border class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_Xaml_Core_RootVisual : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@implementation Uno_UI_Xaml_Core_RootVisual {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xBEF49C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Xaml_Controls_NativeRefreshControl {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}

	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC0809C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIRefreshControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_Xaml_Controls_NativeRefreshVisualizer : Microsoft_UI_Xaml_Controls_RefreshVisualizer {
}
	-(id) init;
@end

@implementation Uno_UI_Xaml_Controls_NativeRefreshVisualizer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC0899C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_RefreshVisualizer class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_Xaml_Controls_ProgressRingRefreshVisualizer : Microsoft_UI_Xaml_Controls_RefreshVisualizer {
}
	-(id) init;
@end

@implementation Uno_UI_Xaml_Controls_ProgressRingRefreshVisualizer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC08D9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_RefreshVisualizer class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_Xaml_Controls_WindowChrome : Microsoft_UI_Xaml_Controls_ContentControl {
}
	-(id) init;
@end

@implementation Uno_UI_Xaml_Controls_WindowChrome {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC1E59C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__UIKit_UIGestureRecognizerDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x83);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@interface Uno_UI_Helpers_NativeFramePresenterUIGestureRecognizerDelegate : NSObject<UIGestureRecognizerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(BOOL) gestureRecognizerShouldBegin:(UIGestureRecognizer *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Uno_UI_Helpers_NativeFramePresenterUIGestureRecognizerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(BOOL) gestureRecognizerShouldBegin:(UIGestureRecognizer *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_36 (self, _cmd, &managed_method, p0, 0xC2139C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation Uno_UI_Views_Controls_DataTemplateSelectorControl {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC61E9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_Controls_AppBarButtonWrapper : Microsoft_UI_Xaml_Controls_Border {
}
	-(id) init;
@end

@implementation Uno_UI_Controls_AppBarButtonWrapper {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC74C9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Border class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_Controls_TitleView : Microsoft_UI_Xaml_Controls_Border {
}
	-(void) didMoveToSuperview;
	-(CGRect) frame;
	-(void) setFrame:(CGRect)p0;
	-(id) init;
@end

@implementation Uno_UI_Controls_TitleView {
}

	-(void) didMoveToSuperview
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC7809C);
	}

	-(CGRect) frame
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_10 (self, _cmd, &managed_method, 0xC7849C);
	}

	-(void) setFrame:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, 0xC7859C);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC7819C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Border class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Controls_LineView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}

	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC7D59C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__UIKit_UIViewControllerTransitioningDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x87);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@implementation Uno_UI_Controls_ViewControllerTransitioningDeligate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(id) animationControllerForPresentedController:(UIViewController *)p0 presentingController:(UIViewController *)p1 sourceController:(UIViewController *)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_42 (self, _cmd, &managed_method, p0, p1, p2, 0xC8C49C);
	}

	-(id) animationControllerForDismissedController:(UIViewController *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_43 (self, _cmd, &managed_method, p0, 0xC8C59C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation Uno_UI_Views_Controls_BindableUICollectionView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC6639C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xC6649C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation Uno_UI_Controls_Legacy_ListViewBase {
}

	-(CGSize) sizeThatFits:(CGSize)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, p0, 0xC9699C);
	}

	-(void) setNeedsLayout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC97E9C);
	}

	-(void *) numberOfItemsInSection:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_44 (self, _cmd, &managed_method, p0, 0xC9859C);
	}

	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC9939C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xC9949C);
	}

	-(CGRect) frame
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_10 (self, _cmd, &managed_method, 0xC9C79C);
	}

	-(void) setFrame:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, 0xC9C89C);
	}

	-(void) didMoveToSuperview
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC9DD9C);
	}

	-(BOOL) isHidden
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0xC9F19C);
	}

	-(void) setHidden:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0xC9F29C);
	}

	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_12 (self, _cmd, &managed_method, p0, p1, 0xCA0C9C);
	}

	-(NSString *) getDependencyPropertyValue:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0xCA119C);
	}

	-(NSString *) setDependencyPropertyValue:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0xCA129C);
	}

	-(BOOL) accessibilityActivate
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0xCA189C);
	}

	-(BOOL) isAccessibilityElement
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0xCA199C);
	}

	-(void) setIsAccessibilityElement:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0xCA1A9C);
	}
@end

@implementation Uno_UI_Controls_Legacy_GridView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC8FF9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Uno_UI_Controls_Legacy_ListViewBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Controls_Legacy_ListViewBaseSource {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void *) numberOfSectionsInCollectionView:(UICollectionView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_25 (self, _cmd, &managed_method, p0, 0xCB009C);
	}

	-(void *) collectionView:(UICollectionView *)p0 numberOfItemsInSection:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_24 (self, _cmd, &managed_method, p0, p1, 0xCB019C);
	}

	-(BOOL) collectionView:(UICollectionView *)p0 shouldSelectItemAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, p1, 0xCB029C);
	}

	-(void) collectionView:(UICollectionView *)p0 didEndDisplayingCell:(UICollectionViewCell *)p1 forItemAtIndexPath:(NSIndexPath *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_45 (self, _cmd, &managed_method, p0, p1, p2, 0xCB039C);
	}

	-(UICollectionViewCell *) collectionView:(UICollectionView *)p0 cellForItemAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, 0xCB059C);
	}

	-(void) collectionView:(UICollectionView *)p0 willDisplayCell:(UICollectionViewCell *)p1 forItemAtIndexPath:(NSIndexPath *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_45 (self, _cmd, &managed_method, p0, p1, p2, 0xCB069C);
	}

	-(BOOL) collectionView:(UICollectionView *)p0 shouldHighlightItemAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, p1, 0xCB079C);
	}

	-(void) collectionView:(UICollectionView *)p0 didUnhighlightItemAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0xCB089C);
	}

	-(void) collectionView:(UICollectionView *)p0 didHighlightItemAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0xCB099C);
	}

	-(UICollectionReusableView *) collectionView:(UICollectionView *)p0 viewForSupplementaryElementOfKind:(NSString *)p1 atIndexPath:(NSIndexPath *)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_46 (self, _cmd, &managed_method, p0, p1, p2, 0xCB0B9C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xCAEE9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Controls_Legacy_GridViewSource {
}
@end

@implementation Uno_UI_Controls_Legacy_ListView {
}

	-(CGSize) sizeThatFits:(CGSize)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, p0, 0xC92D9C);
	}

	-(void) didMoveToSuperview
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC92E9C);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC92B9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Uno_UI_Controls_Legacy_ListViewBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Controls_Legacy_ListViewSource {
}
@end

@implementation Uno_UI_Views_Controls_BindableUIActivityIndicatorView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC4DB9C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xC4DC9C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC4C19C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIActivityIndicatorView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_Controls_Legacy_NativeProgressRing : Uno_UI_Views_Controls_BindableUIActivityIndicatorView {
}
	-(id) init;
@end

@implementation Uno_UI_Controls_Legacy_NativeProgressRing {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xCB429C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Uno_UI_Views_Controls_BindableUIActivityIndicatorView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Controls_Legacy_ProgressRing {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xCB459C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_ElementStub {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xF0E9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Shapes_Polygon {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x115B9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Shapes_Shape class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Shapes_Polyline {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x116D9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Shapes_Shape class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Microsoft_UI_Xaml_Media_RadialGradientBrush_RadialGradientLayer : CALayer {
}
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) drawInContext:(id)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Microsoft_UI_Xaml_Media_RadialGradientBrush_RadialGradientLayer {
	XamarinObject __monoObjectGCHandle;
}
	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) drawInContext:(id)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_47 (self, _cmd, &managed_method, p0, 0x1BC29C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_AnimatedIcon {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x222C9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_IconElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_AppBarButton {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x23149C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Button class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_AutoSuggestBox {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x23DD9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ItemsControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_BitmapIcon {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x248D9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_IconElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_BreadcrumbBar {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x250B9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_BreadcrumbBarItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x253B9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_CalendarDatePicker {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x25CC9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_CalendarView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x271D9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_CalendarViewBaseItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x56979C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_CalendarViewDayItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x27B69C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_CalendarViewBaseItem class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ColorPicker {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x28069C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ComboBox {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x29259C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_Selector class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_CommandBarOverflowPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2A949C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ItemsControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_DatePicker {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2D799C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Expander {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2E939C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_FontIcon {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2F1B9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_IconElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Frame {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x2F569C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_HyperlinkButton {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x30BF9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_ButtonBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_IconSourceElement {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x31069C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_IconElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Image {
}

	-(void) layoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x31319C);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x31359C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ItemsPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x339E9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ItemsRepeater {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x34089C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ItemsRepeaterScrollHost {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x34619C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ItemsStackPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x34D19C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ItemsView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x34EF9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ItemsWrapGrid {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x35A09C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_MediaPlayerElement {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x37E19C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_MediaPlayerPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x38029C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Border class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_MediaTransportControls {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x381B9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_MenuBarItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x39349C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_MenuFlyoutItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x39AB9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_MenuFlyoutItemBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_MenuFlyoutPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x39E29C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ItemsControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_MenuFlyoutSubItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3A179C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_MenuFlyoutItemBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_NavigationView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3A449C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_NavigationViewItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3C019C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_NavigationViewItemBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_NumberBox {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3D089C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_TextBox {
}

	-(BOOL) becomeFirstResponder
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x4D059C);
	}

	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_12 (self, _cmd, &managed_method, p0, p1, 0x4D109C);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4C869C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_PasswordBox {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3E359C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_TextBox class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_PathIcon {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3E649C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_IconElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_PipsPager {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3EF09C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Pivot {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3F719C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ItemsControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ProgressRing {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x40269C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_RadioButtons {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x40789C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ToggleMenuFlyoutItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4E249C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_MenuFlyoutItem class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_RadioMenuFlyoutItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x40BF9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ToggleMenuFlyoutItem class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_RatingControl {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x40D99C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_RefreshContainer {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x41799C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ScrollView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x44239C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ScrollViewer {
}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x46099C);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x455C9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_SplitView {
}

	-(void) layoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x474B9C);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x474A9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_SwipeControl {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x48329C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_SymbolIcon {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x49139C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_IconElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_TabView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x49369C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_TeachingTip {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4A4E9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_TimePicker {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4D739C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ToggleSwitch {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4E449C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_TreeViewItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4F469C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ListViewItem class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_TreeViewList {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4FB59C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ListView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_TwoPaneView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x50259C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_VariableSizedWrapGrid {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x509B9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_WebView2 {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x512A9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_LayoutPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x52089C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_PagerControl {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x52619C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Microsoft_UI_Xaml_Controls_CalendarViewItem : Microsoft_UI_Xaml_Controls_CalendarViewBaseItem {
}
	-(id) init;
@end

@implementation Microsoft_UI_Xaml_Controls_CalendarViewItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x57879C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_CalendarViewBaseItem class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_DatePickerSelector {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x57CF9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Microsoft_UI_Xaml_Controls_ItemsWrapGridLayout : Microsoft_UI_Xaml_Controls_VirtualizingPanelLayout {
}
	-(id) init;
@end

@implementation Microsoft_UI_Xaml_Controls_ItemsWrapGridLayout {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x58C69C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_VirtualizingPanelLayout class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_ListViewBaseSource {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void *) numberOfSectionsInCollectionView:(UICollectionView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_25 (self, _cmd, &managed_method, p0, 0x59749C);
	}

	-(void *) collectionView:(UICollectionView *)p0 numberOfItemsInSection:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_24 (self, _cmd, &managed_method, p0, p1, 0x59759C);
	}

	-(void) collectionView:(UICollectionView *)p0 didEndDisplayingCell:(UICollectionViewCell *)p1 forItemAtIndexPath:(NSIndexPath *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_45 (self, _cmd, &managed_method, p0, p1, p2, 0x59789C);
	}

	-(UICollectionViewCell *) collectionView:(UICollectionView *)p0 cellForItemAtIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, 0x597A9C);
	}

	-(void) collectionView:(UICollectionView *)p0 willDisplayCell:(UICollectionViewCell *)p1 forItemAtIndexPath:(NSIndexPath *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_45 (self, _cmd, &managed_method, p0, p1, p2, 0x597E9C);
	}

	-(UICollectionReusableView *) collectionView:(UICollectionView *)p0 viewForSupplementaryElementOfKind:(NSString *)p1 atIndexPath:(NSIndexPath *)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_46 (self, _cmd, &managed_method, p0, p1, p2, 0x597F9C);
	}

	-(void) scrollViewDidScroll:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x59829C);
	}

	-(void) scrollViewWillBeginDragging:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x59839C);
	}

	-(void) scrollViewDidEndDragging:(UIScrollView *)p0 willDecelerate:(BOOL)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, p1, 0x59849C);
	}

	-(void) scrollViewDidEndDecelerating:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x59859C);
	}

	-(void) scrollViewDidEndScrollingAnimation:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x59869C);
	}

	-(void) scrollViewDidZoom:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x59879C);
	}

	-(void) scrollViewWillEndDragging:(UIScrollView *)p0 withVelocity:(CGPoint)p1 targetContentOffset:(CGPoint*)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_48 (self, _cmd, &managed_method, p0, p1, p2, 0x598A9C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x59709C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_NativeListViewBase {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(CGSize) sizeThatFits:(CGSize)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, p0, 0x5A7F9C);
	}

	-(void) insertItemsAtIndexPaths:(NSArray *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_29 (self, _cmd, &managed_method, p0, 0x5A819C);
	}

	-(void) insertSections:(NSIndexSet *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x5A829C);
	}

	-(void) deleteItemsAtIndexPaths:(NSArray *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_29 (self, _cmd, &managed_method, p0, 0x5A839C);
	}

	-(void) deleteSections:(NSIndexSet *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x5A849C);
	}

	-(void) reloadItemsAtIndexPaths:(NSArray *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_29 (self, _cmd, &managed_method, p0, 0x5A859C);
	}

	-(void) reloadSections:(NSIndexSet *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x5A869C);
	}

	-(void) setNeedsLayout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5A8E9C);
	}

	-(void) layoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5A8F9C);
	}

	-(void) setContentOffset:(CGPoint)p0 animated:(BOOL)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_49 (self, _cmd, &managed_method, p0, p1, 0x5A9A9C);
	}

	-(void *) numberOfItemsInSection:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_44 (self, _cmd, &managed_method, p0, 0x5A9C9C);
	}

	-(void) touchesBegan:(NSSet *)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x5AA39C);
	}

	-(void) touchesMoved:(NSSet *)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x5AA49C);
	}

	-(void) touchesEnded:(NSSet *)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x5AA59C);
	}

	-(void) touchesCancelled:(NSSet *)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x5AA69C);
	}

	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5AAC9C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x5AAD9C);
	}

	-(CGRect) frame
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_10 (self, _cmd, &managed_method, 0x5AE09C);
	}

	-(void) setFrame:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, 0x5AE19C);
	}

	-(void) didMoveToSuperview
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5AF69C);
	}

	-(BOOL) isHidden
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x5B099C);
	}

	-(void) setHidden:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0x5B0A9C);
	}

	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_12 (self, _cmd, &managed_method, p0, p1, 0x5B249C);
	}

	-(NSString *) getDependencyPropertyValue:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x5B299C);
	}

	-(NSString *) setDependencyPropertyValue:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x5B2A9C);
	}

	-(BOOL) accessibilityActivate
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x5B309C);
	}

	-(BOOL) isAccessibilityElement
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x5B319C);
	}

	-(void) setIsAccessibilityElement:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0x5B329C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x5A7C9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UICollectionView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Picker {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(CGSize) sizeThatFits:(CGSize)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, p0, 0x5D539C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x5D7D9C);
	}

	-(void) layoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5D899C);
	}

	-(void) setNeedsLayout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5D8A9C);
	}

	-(CGRect) frame
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_10 (self, _cmd, &managed_method, 0x5DB29C);
	}

	-(void) setFrame:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, 0x5DB39C);
	}

	-(void) didMoveToSuperview
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5DC89C);
	}

	-(BOOL) isHidden
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x5DDB9C);
	}

	-(void) setHidden:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0x5DDC9C);
	}

	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_12 (self, _cmd, &managed_method, p0, p1, 0x5DF69C);
	}

	-(NSString *) getDependencyPropertyValue:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x5DFB9C);
	}

	-(NSString *) setDependencyPropertyValue:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x5DFC9C);
	}

	-(BOOL) accessibilityActivate
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x5E029C);
	}

	-(BOOL) isAccessibilityElement
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x5E039C);
	}

	-(void) setIsAccessibilityElement:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0x5E049C);
	}

	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5E7C9C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x5D519C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIPickerView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_NativePivotPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x5EC69C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Microsoft_UI_Xaml_Controls_NativeScrollContentPresenter : UIScrollView {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) setContentOffset:(CGPoint)p0 animated:(BOOL)p1;
	-(void) setNeedsLayout;
	-(CGSize) sizeThatFits:(CGSize)p0;
	-(void) layoutSubviews;
	-(void) touchesBegan:(NSSet *)p0 withEvent:(UIEvent *)p1;
	-(void) touchesMoved:(NSSet *)p0 withEvent:(UIEvent *)p1;
	-(void) touchesEnded:(NSSet *)p0 withEvent:(UIEvent *)p1;
	-(void) touchesCancelled:(NSSet *)p0 withEvent:(UIEvent *)p1;
	-(void) didMoveToWindow;
	-(void) willMoveToSuperview:(UIView *)p0;
	-(CGRect) frame;
	-(void) setFrame:(CGRect)p0;
	-(void) didMoveToSuperview;
	-(BOOL) isHidden;
	-(void) setHidden:(BOOL)p0;
	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1;
	-(NSString *) getDependencyPropertyValue:(NSString *)p0;
	-(NSString *) setDependencyPropertyValue:(NSString *)p0;
	-(BOOL) accessibilityActivate;
	-(BOOL) isAccessibilityElement;
	-(void) setIsAccessibilityElement:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Microsoft_UI_Xaml_Controls_NativeScrollContentPresenter {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) setContentOffset:(CGPoint)p0 animated:(BOOL)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_49 (self, _cmd, &managed_method, p0, p1, 0x5F4D9C);
	}

	-(void) setNeedsLayout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5F509C);
	}

	-(CGSize) sizeThatFits:(CGSize)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, p0, 0x5F559C);
	}

	-(void) layoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5F569C);
	}

	-(void) touchesBegan:(NSSet *)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x5F609C);
	}

	-(void) touchesMoved:(NSSet *)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x5F619C);
	}

	-(void) touchesEnded:(NSSet *)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x5F629C);
	}

	-(void) touchesCancelled:(NSSet *)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x5F639C);
	}

	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5F7A9C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x5F7B9C);
	}

	-(CGRect) frame
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_10 (self, _cmd, &managed_method, 0x5FAE9C);
	}

	-(void) setFrame:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, 0x5FAF9C);
	}

	-(void) didMoveToSuperview
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x5FC49C);
	}

	-(BOOL) isHidden
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x5FD79C);
	}

	-(void) setHidden:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0x5FD89C);
	}

	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_12 (self, _cmd, &managed_method, p0, p1, 0x5FF29C);
	}

	-(NSString *) getDependencyPropertyValue:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x5FF79C);
	}

	-(NSString *) setDependencyPropertyValue:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x5FF89C);
	}

	-(BOOL) accessibilityActivate
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x5FFE9C);
	}

	-(BOOL) isAccessibilityElement
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x5FFF9C);
	}

	-(void) setIsAccessibilityElement:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0x60009C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x5F439C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIScrollView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_MultilineTextBoxView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void *) selectedTextRange
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_50 (self, _cmd, &managed_method, 0x60EE9C);
	}

	-(void) setSelectedTextRange:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_51 (self, _cmd, &managed_method, p0, 0x60EF9C);
	}

	-(void) paste:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x60D79C);
	}

	-(void) pasteAndGo:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x60D89C);
	}

	-(void) pasteAndMatchStyle:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x60D99C);
	}

	-(void) pasteAndSearch:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x60DA9C);
	}

	-(void) pasteItemProviders:(NSArray *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_29 (self, _cmd, &managed_method, p0, 0x60DB9C);
	}

	-(NSString *) text
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_52 (self, _cmd, &managed_method, 0x60E29C);
	}

	-(void) setText:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_41 (self, _cmd, &managed_method, p0, 0x60E39C);
	}

	-(CGSize) sizeThatFits:(CGSize)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, p0, 0x60E79C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x60F69C);
	}

	-(void) layoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x61029C);
	}

	-(void) setNeedsLayout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x61039C);
	}

	-(CGRect) frame
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_10 (self, _cmd, &managed_method, 0x612B9C);
	}

	-(void) setFrame:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, 0x612C9C);
	}

	-(void) didMoveToSuperview
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x61419C);
	}

	-(BOOL) isHidden
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x61549C);
	}

	-(void) setHidden:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0x61559C);
	}

	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_12 (self, _cmd, &managed_method, p0, p1, 0x616F9C);
	}

	-(NSString *) getDependencyPropertyValue:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x61749C);
	}

	-(NSString *) setDependencyPropertyValue:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x61759C);
	}

	-(BOOL) accessibilityActivate
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x617B9C);
	}

	-(BOOL) isAccessibilityElement
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x617C9C);
	}

	-(void) setIsAccessibilityElement:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0x617D9C);
	}

	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x61F59C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x620A9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UITextView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__UIKit_UITextFieldDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xAF);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@implementation Microsoft_UI_Xaml_Controls_SinglelineTextBoxDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(BOOL) textField:(UITextField *)p0 shouldChangeCharactersInRange:(NSRange)p1 replacementString:(NSString *)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_35 (self, _cmd, &managed_method, p0, p1, p2, 0x62429C);
	}

	-(BOOL) textFieldShouldReturn:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_36 (self, _cmd, &managed_method, p0, 0x62439C);
	}

	-(void) textFieldDidBeginEditing:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x62449C);
	}

	-(void) textFieldDidEndEditing:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x62459C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_SinglelineTextBoxView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void *) selectedTextRange
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_50 (self, _cmd, &managed_method, 0x62689C);
	}

	-(void) setSelectedTextRange:(void *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_51 (self, _cmd, &managed_method, p0, 0x62699C);
	}

	-(void) paste:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x624B9C);
	}

	-(void) pasteAndGo:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x624C9C);
	}

	-(void) pasteAndMatchStyle:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x624D9C);
	}

	-(void) pasteAndSearch:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x624E9C);
	}

	-(void) pasteItemProviders:(NSArray *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_29 (self, _cmd, &managed_method, p0, 0x624F9C);
	}

	-(NSString *) text
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_52 (self, _cmd, &managed_method, 0x62529C);
	}

	-(void) setText:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_41 (self, _cmd, &managed_method, p0, 0x62539C);
	}

	-(BOOL) becomeFirstResponder
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x62589C);
	}

	-(CGSize) sizeThatFits:(CGSize)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_9 (self, _cmd, &managed_method, p0, 0x62599C);
	}

	-(CGRect) textRectForBounds:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_53 (self, _cmd, &managed_method, p0, 0x625A9C);
	}

	-(CGRect) placeholderRectForBounds:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_53 (self, _cmd, &managed_method, p0, 0x625B9C);
	}

	-(CGRect) editingRectForBounds:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_53 (self, _cmd, &managed_method, p0, 0x625C9C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x626E9C);
	}

	-(void) layoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x627A9C);
	}

	-(void) setNeedsLayout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x627B9C);
	}

	-(CGRect) frame
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_10 (self, _cmd, &managed_method, 0x62A39C);
	}

	-(void) setFrame:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, 0x62A49C);
	}

	-(void) didMoveToSuperview
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x62B99C);
	}

	-(BOOL) isHidden
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x62CE9C);
	}

	-(void) setHidden:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0x62CF9C);
	}

	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_12 (self, _cmd, &managed_method, p0, p1, 0x62E99C);
	}

	-(NSString *) getDependencyPropertyValue:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x62EE9C);
	}

	-(NSString *) setDependencyPropertyValue:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x62EF9C);
	}

	-(BOOL) accessibilityActivate
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x62F59C);
	}

	-(BOOL) isAccessibilityElement
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x62F69C);
	}

	-(void) setIsAccessibilityElement:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0x62F79C);
	}

	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x636F9C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x63849C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UITextField class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_TimePickerSelector {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x63D99C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__WebKit_WKNavigationDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xB9);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@interface Microsoft_UI_Xaml_Controls_WebViewNavigationDelegate : NSObject<WKNavigationDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) webView:(WKWebView *)p0 decidePolicyForNavigationAction:(WKNavigationAction *)p1 decisionHandler:(void (^)(void *))p2;
	-(void) webView:(WKWebView *)p0 decidePolicyForNavigationResponse:(WKNavigationResponse *)p1 decisionHandler:(void (^)(void *))p2;
	-(void) webView:(WKWebView *)p0 didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)p1;
	-(void) webViewWebContentProcessDidTerminate:(WKWebView *)p0;
	-(void) webView:(WKWebView *)p0 didCommitNavigation:(WKNavigation *)p1;
	-(void) webView:(WKWebView *)p0 didFinishNavigation:(WKNavigation *)p1;
	-(void) webView:(WKWebView *)p0 didFailNavigation:(WKNavigation *)p1 withError:(NSError *)p2;
	-(void) webView:(WKWebView *)p0 didStartProvisionalNavigation:(WKNavigation *)p1;
	-(void) webView:(WKWebView *)p0 didFailProvisionalNavigation:(WKNavigation *)p1 withError:(NSError *)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Microsoft_UI_Xaml_Controls_WebViewNavigationDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) webView:(WKWebView *)p0 decidePolicyForNavigationAction:(WKNavigationAction *)p1 decisionHandler:(void (^)(void *))p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_54 (self, _cmd, &managed_method, p0, p1, p2, 0x64599C);
	}

	-(void) webView:(WKWebView *)p0 decidePolicyForNavigationResponse:(WKNavigationResponse *)p1 decisionHandler:(void (^)(void *))p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_55 (self, _cmd, &managed_method, p0, p1, p2, 0x645A9C);
	}

	-(void) webView:(WKWebView *)p0 didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x645B9C);
	}

	-(void) webViewWebContentProcessDidTerminate:(WKWebView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x645C9C);
	}

	-(void) webView:(WKWebView *)p0 didCommitNavigation:(WKNavigation *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x645D9C);
	}

	-(void) webView:(WKWebView *)p0 didFinishNavigation:(WKNavigation *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x645E9C);
	}

	-(void) webView:(WKWebView *)p0 didFailNavigation:(WKNavigation *)p1 withError:(NSError *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_45 (self, _cmd, &managed_method, p0, p1, p2, 0x645F9C);
	}

	-(void) webView:(WKWebView *)p0 didStartProvisionalNavigation:(WKNavigation *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x64609C);
	}

	-(void) webView:(WKWebView *)p0 didFailProvisionalNavigation:(WKNavigation *)p1 withError:(NSError *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_45 (self, _cmd, &managed_method, p0, p1, p2, 0x64619C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_WebView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x64649C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_CalendarPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x65E59C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_ColorSpectrum {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x66BD9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_LoopingSelector {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6A709C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_LoopingSelectorItem {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6AC29C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_NavigationViewItemPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6B329C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_ScrollBar {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6C829C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Primitives_RangeBase class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_ScrollPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x6CEB9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Microsoft_UI_Xaml_Controls_Primitives_PopupRoot : Microsoft_UI_Xaml_Controls_Panel {
}
	-(id) init;
@end

@implementation Microsoft_UI_Xaml_Controls_Primitives_PopupRoot {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x70489C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_WinRT_Extensions_UI_Popups_MessageDialogContentDialog : Microsoft_UI_Xaml_Controls_ContentDialog {
}
	-(id) init;
@end

@implementation Uno_UI_WinRT_Extensions_UI_Popups_MessageDialogContentDialog {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xBDCA9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentDialog class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_Xaml_Controls_SystemFocusVisual : Microsoft_UI_Xaml_Controls_Control {
}
	-(id) init;
@end

@implementation Uno_UI_Xaml_Controls_SystemFocusVisual {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC0D09C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Control class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Views_Controls_BindableUIAlertView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC5109C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xC5119C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC4FA9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIAlertView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Views_Controls_BindableUIButton {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC5499C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xC54A9C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC52A9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIButton class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Views_Controls_BindableUIProgressView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(float) progress
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_56 (self, _cmd, &managed_method, 0xC5689C);
	}

	-(void) setProgress:(float)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_57 (self, _cmd, &managed_method, p0, 0xC5699C);
	}

	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC57F9C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xC5809C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC5639C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIProgressView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Views_Controls_BindableUIScrollView {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC5B59C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xC5B69C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC59F9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIScrollView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Views_Controls_BindableUISwitch {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC5FE9C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xC5FF9C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC5CF9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UISwitch class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Views_Controls_StrategyBasedDataTemplateSelectorControl {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC6269C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Uno_UI_Views_Controls_DataTemplateSelectorControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Controls_BindableSearchBar {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(NSString *) placeholder
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_52 (self, _cmd, &managed_method, 0xC6839C);
	}

	-(void) setPlaceholder:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_41 (self, _cmd, &managed_method, p0, 0xC6849C);
	}

	-(NSString *) text
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_52 (self, _cmd, &managed_method, 0xC6859C);
	}

	-(void) setText:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_41 (self, _cmd, &managed_method, p0, 0xC6869C);
	}

	-(BOOL) enablesReturnKeyAutomatically
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0xC68B9C);
	}

	-(void) setEnablesReturnKeyAutomatically:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0xC68C9C);
	}

	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC6A99C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xC6AA9C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC67D9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UISearchBar class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Controls_BindableUISlider {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(float) value
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_56 (self, _cmd, &managed_method, 0xC6C99C);
	}

	-(void) setValue:(float)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_57 (self, _cmd, &managed_method, p0, 0xC6CA9C);
	}

	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC6E29C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xC6E39C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC6C39C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UISlider class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Controls_NativeCommandBarPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC79E9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentPresenter class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Controls_FauxGradientBorderPresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC7A59C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_ContentPresenter class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_Controls_NativeFramePresenter_PageViewController : UIViewController {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) viewWillAppear:(BOOL)p0;
	-(void) viewWillDisappear:(BOOL)p0;
	-(void) viewDidDisappear:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Uno_UI_Controls_NativeFramePresenter_PageViewController {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) viewWillAppear:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0xC80B9C);
	}

	-(void) viewWillDisappear:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0xC80C9C);
	}

	-(void) viewDidDisappear:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0xC80D9C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Uno_UI_Controls_NativeFramePresenter_ControllerDelegate : NSObject<UINavigationControllerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) navigationController:(UINavigationController *)p0 willShowViewController:(UIViewController *)p1 animated:(BOOL)p2;
	-(void) navigationController:(UINavigationController *)p0 didShowViewController:(UIViewController *)p1 animated:(BOOL)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Uno_UI_Controls_NativeFramePresenter_ControllerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) navigationController:(UINavigationController *)p0 willShowViewController:(UIViewController *)p1 animated:(BOOL)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, p2, 0xC81A9C);
	}

	-(void) navigationController:(UINavigationController *)p0 didShowViewController:(UIViewController *)p1 animated:(BOOL)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_22 (self, _cmd, &managed_method, p0, p1, p2, 0xC81B9C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation Uno_UI_Controls_NativeFramePresenter {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC7DC9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_FrameworkElement class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Controls_RootViewController {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) viewSafeAreaInsetsDidChange
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC8419C);
	}

	-(NSUInteger) supportedInterfaceOrientations
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_58 (self, _cmd, &managed_method, 0xC8429C);
	}

	-(void) motionEnded:(NSInteger)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_59 (self, _cmd, &managed_method, p0, p1, 0xC8439C);
	}

	-(BOOL) shouldAutorotate
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0xC8469C);
	}

	-(void) traitCollectionDidChange:(UITraitCollection *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xC8479C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC83B9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UINavigationController class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Controls_StatePresenter {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC84F9C);
	}

	-(BOOL) isEnabled
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0xC8509C);
	}

	-(void) setEnabled:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0xC8519C);
	}

	-(BOOL) isSelected
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0xC8529C);
	}

	-(void) setSelected:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0xC8539C);
	}

	-(BOOL) isHighlighted
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0xC8549C);
	}

	-(void) setHighlighted:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_7 (self, _cmd, &managed_method, p0, 0xC8559C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xC86E9C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC84E9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIControl class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Controls_UnoNavigationBar {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(CGRect) frame
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_10 (self, _cmd, &managed_method, 0xC8909C);
	}

	-(void) setFrame:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, 0xC8919C);
	}

	-(CGRect) bounds
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_10 (self, _cmd, &managed_method, 0xC8929C);
	}

	-(void) setBounds:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, 0xC8939C);
	}

	-(void) didMoveToWindow
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xC8A99C);
	}

	-(void) willMoveToSuperview:(UIView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xC8AA9C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC88B9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UINavigationBar class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Controls_ManagedItemsStackPanel {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC8C99C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Controls_Panel class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Controls_Window {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) pressesEnded:(NSSet <UIPress *>*)p0 withEvent:(UIPressesEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0xC8E19C);
	}

	-(void) pressesBegan:(NSSet <UIPress *>*)p0 withEvent:(UIPressesEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0xC8E29C);
	}

	-(UIView *) hitTest:(CGPoint)p0 withEvent:(UIEvent *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_12 (self, _cmd, &managed_method, p0, p1, 0xC8E99C);
	}

	-(CGRect) frame
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_10 (self, _cmd, &managed_method, 0xC8EF9C);
	}

	-(void) setFrame:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_11 (self, _cmd, &managed_method, p0, 0xC8F09C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC8E09C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIWindow class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Controls_Legacy_ListViewBaseLayout {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(NSArray *) layoutAttributesForElementsInRect:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_28 (self, _cmd, &managed_method, p0, 0xCAAB9C);
	}

	-(UICollectionViewLayoutAttributes *) layoutAttributesForItemAtIndexPath:(NSIndexPath *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0xCAAC9C);
	}

	-(UICollectionViewLayoutAttributes *) layoutAttributesForSupplementaryViewOfKind:(NSString *)p0 atIndexPath:(NSIndexPath *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, 0xCAAD9C);
	}

	-(CGSize) collectionViewContentSize
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_26 (self, _cmd, &managed_method, 0xCAAE9C);
	}

	-(void) prepareLayout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xCAAF9C);
	}

	-(BOOL) shouldInvalidateLayoutForBoundsChange:(CGRect)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_30 (self, _cmd, &managed_method, p0, 0xCAB99C);
	}

	-(void) invalidateLayout
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xCABA9C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xCAAA9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UICollectionViewLayout class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_UI_Controls_Legacy_GridViewWrapGridLayout {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC90D9C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Uno_UI_Controls_Legacy_ListViewBaseLayout class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface LegacyInternalContainer : UICollectionViewCell {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) applyLayoutAttributes:(UICollectionViewLayoutAttributes *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation LegacyInternalContainer {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) applyLayoutAttributes:(UICollectionViewLayoutAttributes *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0xCB229C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation Uno_UI_Controls_Legacy_ListViewLayout {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xCB329C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Uno_UI_Controls_Legacy_ListViewBaseLayout class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_UI_Controls_NativeFramePresenter_FrameNavigationController : UINavigationController {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(UIViewController *) popViewControllerAnimated:(BOOL)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Uno_UI_Controls_NativeFramePresenter_FrameNavigationController {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(UIViewController *) popViewControllerAnimated:(BOOL)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_21 (self, _cmd, &managed_method, p0, 0xC8149C);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xC8139C);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UINavigationController class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation Uno_Media_Playback_VideoSurface {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) layoutSubviews
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0xA3A0);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xA4A0);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIView class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__UIKit_UIImagePickerControllerDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xD1);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@interface Windows_Media_Capture_CameraDelegate : NSObject<UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) imagePickerController:(UIImagePickerController *)p0 didFinishPickingMediaWithInfo:(NSDictionary *)p1;
	-(void) imagePickerControllerDidCancel:(UIImagePickerController *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Windows_Media_Capture_CameraDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) imagePickerController:(UIImagePickerController *)p0 didFinishPickingMediaWithInfo:(NSDictionary *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x473A0);
	}

	-(void) imagePickerControllerDidCancel:(UIImagePickerController *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x474A0);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x471A0);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__CallKit_CXCallObserverDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xD9);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@interface Windows_ApplicationModel_Calls_CallObserverDelegate : NSObject<CXCallObserverDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) callObserver:(CXCallObserver *)p0 callChanged:(CXCall *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Windows_ApplicationModel_Calls_CallObserverDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) callObserver:(CXCallObserver *)p0 callChanged:(CXCall *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x62AA0);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x62BA0);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Uno_AuthenticationBroker_WebAuthenticationBrokerProvider_PresentationContextProviderToSharedKeyWindow : NSObject<ASWebAuthenticationPresentationContextProviding> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(UIWindow *) presentationAnchorForWebAuthenticationSession:(ASWebAuthenticationSession *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Uno_AuthenticationBroker_WebAuthenticationBrokerProvider_PresentationContextProviderToSharedKeyWindow {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(UIWindow *) presentationAnchorForWebAuthenticationSession:(ASWebAuthenticationSession *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x9AA0);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x9BA0);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Windows_Storage_Pickers_FileOpenPicker_ImageOpenPickerDelegate : NSObject<UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) imagePickerControllerDidCancel:(UIImagePickerController *)p0;
	-(void) imagePickerController:(UIImagePickerController *)p0 didFinishPickingMediaWithInfo:(NSDictionary *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Windows_Storage_Pickers_FileOpenPicker_ImageOpenPickerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) imagePickerControllerDidCancel:(UIImagePickerController *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x3E3A0);
	}

	-(void) imagePickerController:(UIImagePickerController *)p0 didFinishPickingMediaWithInfo:(NSDictionary *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x3E4A0);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__UIKit_UIAdaptivePresentationControllerDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xE1);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@interface Windows_Storage_Pickers_FileOpenPicker_FileOpenPickerPresentationControllerDelegate : NSObject<UIAdaptivePresentationControllerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) presentationControllerDidDismiss:(UIPresentationController *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Windows_Storage_Pickers_FileOpenPicker_FileOpenPickerPresentationControllerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) presentationControllerDidDismiss:(UIPresentationController *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x3FEA0);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__UIKit_UIDocumentPickerDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xE5);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@interface Windows_Storage_Pickers_FolderPicker_FolderPickerDelegate : NSObject<UIDocumentPickerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) documentPickerWasCancelled:(UIDocumentPickerViewController *)p0;
	-(void) documentPicker:(UIDocumentPickerViewController *)p0 didPickDocumentAtURL:(NSURL *)p1;
	-(void) documentPicker:(UIDocumentPickerViewController *)p0 didPickDocumentsAtURLs:(NSArray *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Windows_Storage_Pickers_FolderPicker_FolderPickerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) documentPickerWasCancelled:(UIDocumentPickerViewController *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x400A0);
	}

	-(void) documentPicker:(UIDocumentPickerViewController *)p0 didPickDocumentAtURL:(NSURL *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x401A0);
	}

	-(void) documentPicker:(UIDocumentPickerViewController *)p0 didPickDocumentsAtURLs:(NSArray *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_60 (self, _cmd, &managed_method, p0, p1, 0x402A0);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Windows_Storage_Pickers_FolderPicker_FolderPickerPresentationControllerDelegate : NSObject<UIAdaptivePresentationControllerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) presentationControllerDidDismiss:(UIPresentationController *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Windows_Storage_Pickers_FolderPicker_FolderPickerPresentationControllerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) presentationControllerDidDismiss:(UIPresentationController *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x404A0);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Windows_Media_Playback_MediaPlayer_Observer : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) observeValueForKeyPath:(NSString *)p0 ofObject:(NSObject *)p1 change:(NSDictionary *)p2 context:(void *)p3;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Windows_Media_Playback_MediaPlayer_Observer {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) observeValueForKeyPath:(NSString *)p0 ofObject:(NSObject *)p1 change:(NSDictionary *)p2 context:(void *)p3
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_61 (self, _cmd, &managed_method, p0, p1, p2, p3, 0x458A0);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Windows_Media_Capture_CameraCaptureUI_LockedOrientationUIImagePickerController : UIImagePickerController {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(NSUInteger) supportedInterfaceOrientations;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Windows_Media_Capture_CameraCaptureUI_LockedOrientationUIImagePickerController {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(NSUInteger) supportedInterfaceOrientations
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_58 (self, _cmd, &managed_method, 0x470A0);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Windows_Devices_Geolocation_Geolocator_CLLocationManagerDelegate : NSObject<CLLocationManagerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) locationManager:(CLLocationManager *)p0 didChangeAuthorizationStatus:(unsigned int)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Windows_Devices_Geolocation_Geolocator_CLLocationManagerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) locationManager:(CLLocationManager *)p0 didChangeAuthorizationStatus:(unsigned int)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_62 (self, _cmd, &managed_method, p0, p1, 0x545A0);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x546A0);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__UIKit_UIActivityItemSource {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xEF);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@interface Windows_ApplicationModel_DataTransfer_DataTransferManager_DataActivityItemSource : NSObject<UIActivityItemSource> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(NSObject *) activityViewController:(UIActivityViewController *)p0 itemForActivityType:(NSString *)p1;
	-(NSString *) activityViewController:(UIActivityViewController *)p0 subjectForActivityType:(NSString *)p1;
	-(NSObject *) activityViewControllerPlaceholderItem:(UIActivityViewController *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Windows_ApplicationModel_DataTransfer_DataTransferManager_DataActivityItemSource {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(NSObject *) activityViewController:(UIActivityViewController *)p0 itemForActivityType:(NSString *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_23 (self, _cmd, &managed_method, p0, p1, 0x5E1A0);
	}

	-(NSString *) activityViewController:(UIActivityViewController *)p0 subjectForActivityType:(NSString *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_63 (self, _cmd, &managed_method, p0, p1, 0x5E2A0);
	}

	-(NSObject *) activityViewControllerPlaceholderItem:(UIActivityViewController *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x5E3A0);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__ContactsUI_CNContactPickerDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xF3);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@interface Windows_ApplicationModel_Contacts_ContactPicker_SingleContactPickerDelegate : NSObject<CNContactPickerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) contactPickerDidCancel:(CNContactPickerViewController *)p0;
	-(void) contactPicker:(CNContactPickerViewController *)p0 didSelectContact:(CNContact *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Windows_ApplicationModel_Contacts_ContactPicker_SingleContactPickerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) contactPickerDidCancel:(CNContactPickerViewController *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x624A0);
	}

	-(void) contactPicker:(CNContactPickerViewController *)p0 didSelectContact:(CNContact *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x625A0);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Windows_ApplicationModel_Contacts_ContactPicker_MultipleContactPickerDelegate : NSObject<CNContactPickerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) contactPickerDidCancel:(CNContactPickerViewController *)p0;
	-(void) contactPicker:(CNContactPickerViewController *)p0 didSelectContacts:(NSArray *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Windows_ApplicationModel_Contacts_ContactPicker_MultipleContactPickerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) contactPickerDidCancel:(CNContactPickerViewController *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x628A0);
	}

	-(void) contactPicker:(CNContactPickerViewController *)p0 didSelectContacts:(NSArray *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_60 (self, _cmd, &managed_method, p0, p1, 0x629A0);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__PhotosUI_PHPickerViewControllerDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0xF7);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@interface Windows_Storage_Pickers_FileOpenPicker_PhotoPickerDelegate : NSObject<PHPickerViewControllerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) picker:(PHPickerViewController *)p0 didFinishPicking:(NSArray *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Windows_Storage_Pickers_FileOpenPicker_PhotoPickerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) picker:(PHPickerViewController *)p0 didFinishPicking:(NSArray *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_60 (self, _cmd, &managed_method, p0, p1, 0x3E6A0);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Windows_Storage_Pickers_FileOpenPicker_FileOpenPickerDelegate : NSObject<UIDocumentPickerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) documentPickerWasCancelled:(UIDocumentPickerViewController *)p0;
	-(void) documentPicker:(UIDocumentPickerViewController *)p0 didPickDocumentAtURL:(NSURL *)p1;
	-(void) documentPicker:(UIDocumentPickerViewController *)p0 didPickDocumentsAtURLs:(NSArray *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Windows_Storage_Pickers_FileOpenPicker_FileOpenPickerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) documentPickerWasCancelled:(UIDocumentPickerViewController *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x3F6A0);
	}

	-(void) documentPicker:(UIDocumentPickerViewController *)p0 didPickDocumentAtURL:(NSURL *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x3F7A0);
	}

	-(void) documentPicker:(UIDocumentPickerViewController *)p0 didPickDocumentsAtURLs:(NSArray *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_60 (self, _cmd, &managed_method, p0, p1, 0x3F8A0);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation Uno_UI_RemoteControl_RemoteControlStatusView {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x70A2);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Microsoft_UI_Xaml_Shapes_Ellipse class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__MessageUI_MFMailComposeViewControllerDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x105);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@interface MessageUI_Mono_MFMailComposeViewControllerDelegate : NSObject<MFMailComposeViewControllerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) mailComposeController:(MFMailComposeViewController *)p0 didFinishWithResult:(NSInteger)p1 error:(NSError *)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation MessageUI_Mono_MFMailComposeViewControllerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) mailComposeController:(MFMailComposeViewController *)p0 didFinishWithResult:(NSInteger)p1 error:(NSError *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_64 (self, _cmd, &managed_method, p0, p1, p2, 0x109);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x10B);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface Foundation_NSDispatcher : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) xamarinApplySelector;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation Foundation_NSDispatcher {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x139);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x13B);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface __MonoMac_NSActionDispatcher : Foundation_NSDispatcher {
}
	-(void) xamarinApplySelector;
@end

@implementation __MonoMac_NSActionDispatcher {
}

	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x13F);
	}
@end

@interface __MonoMac_NSSynchronizationContextDispatcher : Foundation_NSDispatcher {
}
	-(void) xamarinApplySelector;
@end

@implementation __MonoMac_NSSynchronizationContextDispatcher {
}

	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x143);
	}
@end

@interface Foundation_NSAsyncDispatcher : Foundation_NSDispatcher {
}
	-(void) xamarinApplySelector;
	-(id) init;
@end

@implementation Foundation_NSAsyncDispatcher {
}

	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x147);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x149);
		if (call_super && rv) {
			struct objc_super super = {  rv, [Foundation_NSDispatcher class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface __MonoMac_NSAsyncActionDispatcher : Foundation_NSAsyncDispatcher {
}
	-(void) xamarinApplySelector;
@end

@implementation __MonoMac_NSAsyncActionDispatcher {
}

	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x14D);
	}
@end

@interface __MonoMac_NSAsyncSynchronizationContextDispatcher : Foundation_NSAsyncDispatcher {
}
	-(void) xamarinApplySelector;
@end

@implementation __MonoMac_NSAsyncSynchronizationContextDispatcher {
}

	-(void) xamarinApplySelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x151);
	}
@end

@implementation Foundation_NSExceptionError {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}

	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface Foundation_InternalNSNotificationHandler : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) post:(NSNotification *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation Foundation_InternalNSNotificationHandler {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) post:(NSNotification *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x183);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wprotocol"
#pragma clang diagnostic ignored "-Wobjc-protocol-property-synthesis"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
@implementation Microsoft_iOS__Foundation_NSUrlSessionDataDelegate {
}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x1C9);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end
#pragma clang diagnostic pop

@interface UIKit_UIControlEventProxy : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) BridgeSelector;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation UIKit_UIControlEventProxy {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) BridgeSelector
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x213);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface GLKit_GLKView__GLKViewDelegate : NSObject<GLKViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) glkView:(GLKView *)p0 drawInRect:(CGRect)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation GLKit_GLKView__GLKViewDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) glkView:(GLKView *)p0 drawInRect:(CGRect)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_19 (self, _cmd, &managed_method, p0, p1, 0x3A3);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface __NSObject_Disposer : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	+(void) drain:(NSObject *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation __NSObject_Disposer {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	+(void) drain:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_65 (self, _cmd, &managed_method, p0, 0x3B3);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3B5);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface CoreAnimation_CAAnimation__CAAnimationDelegate : NSObject<CAAnimationDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) animationDidStart:(CAAnimation *)p0;
	-(void) animationDidStop:(CAAnimation *)p0 finished:(BOOL)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation CoreAnimation_CAAnimation__CAAnimationDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) animationDidStart:(CAAnimation *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x3BD);
	}

	-(void) animationDidStop:(CAAnimation *)p0 finished:(BOOL)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, p1, 0x3BF);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x3C1);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface System_Net_Http_NSUrlSessionHandler_WrappedNSInputStream : NSInputStream {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(NSUInteger) streamStatus;
	-(void) open;
	-(void) close;
	-(void *) read:(void *)p0 maxLength:(void *)p1;
	-(NSError *) streamError;
	-(BOOL) hasBytesAvailable;
	-(BOOL) getBuffer:(void **)p0 length:(void **)p1;
	-(NSObject *) propertyForKey:(NSString *)p0;
	-(BOOL) setProperty:(NSObject *)p0 forKey:(NSString *)p1;
	-(BOOL) _setCFClientFlags:(NSUInteger)p0 callback:(void *)p1 context:(void *)p2;
	-(void) scheduleInRunLoop:(NSRunLoop *)p0 forMode:(NSString *)p1;
	-(void) removeFromRunLoop:(NSRunLoop *)p0 forMode:(NSString *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation System_Net_Http_NSUrlSessionHandler_WrappedNSInputStream {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(NSUInteger) streamStatus
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_58 (self, _cmd, &managed_method, 0x3C5);
	}

	-(void) open
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x3C7);
	}

	-(void) close
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_5 (self, _cmd, &managed_method, 0x3C9);
	}

	-(void *) read:(void *)p0 maxLength:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_66 (self, _cmd, &managed_method, p0, p1, 0x3CB);
	}

	-(NSError *) streamError
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_18 (self, _cmd, &managed_method, 0x3CD);
	}

	-(BOOL) hasBytesAvailable
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_6 (self, _cmd, &managed_method, 0x3CF);
	}

	-(BOOL) getBuffer:(void **)p0 length:(void **)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_67 (self, _cmd, &managed_method, p0, p1, 0x3D1);
	}

	-(NSObject *) propertyForKey:(NSString *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x3D3);
	}

	-(BOOL) setProperty:(NSObject *)p0 forKey:(NSString *)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_2 (self, _cmd, &managed_method, p0, p1, 0x3D5);
	}

	-(BOOL) _setCFClientFlags:(NSUInteger)p0 callback:(void *)p1 context:(void *)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_68 (self, _cmd, &managed_method, p0, p1, p2, 0x3D7);
	}

	-(void) scheduleInRunLoop:(NSRunLoop *)p0 forMode:(NSString *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x3D9);
	}

	-(void) removeFromRunLoop:(NSRunLoop *)p0 forMode:(NSString *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x3DB);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface UIKit_UIActionSheet__UIActionSheetDelegate : NSObject<UIActionSheetDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) actionSheetCancel:(UIActionSheet *)p0;
	-(void) actionSheet:(UIActionSheet *)p0 clickedButtonAtIndex:(void *)p1;
	-(void) actionSheet:(UIActionSheet *)p0 didDismissWithButtonIndex:(void *)p1;
	-(void) didPresentActionSheet:(UIActionSheet *)p0;
	-(void) actionSheet:(UIActionSheet *)p0 willDismissWithButtonIndex:(void *)p1;
	-(void) willPresentActionSheet:(UIActionSheet *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation UIKit_UIActionSheet__UIActionSheetDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) actionSheetCancel:(UIActionSheet *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x3DF);
	}

	-(void) actionSheet:(UIActionSheet *)p0 clickedButtonAtIndex:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_4 (self, _cmd, &managed_method, p0, p1, 0x3E1);
	}

	-(void) actionSheet:(UIActionSheet *)p0 didDismissWithButtonIndex:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_4 (self, _cmd, &managed_method, p0, p1, 0x3E3);
	}

	-(void) didPresentActionSheet:(UIActionSheet *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x3E5);
	}

	-(void) actionSheet:(UIActionSheet *)p0 willDismissWithButtonIndex:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_4 (self, _cmd, &managed_method, p0, p1, 0x3E7);
	}

	-(void) willPresentActionSheet:(UIActionSheet *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x3E9);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface UIKit_UIAlertView__UIAlertViewDelegate : NSObject<UIAlertViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) alertViewCancel:(UIAlertView *)p0;
	-(void) alertView:(UIAlertView *)p0 clickedButtonAtIndex:(void *)p1;
	-(void) alertView:(UIAlertView *)p0 didDismissWithButtonIndex:(void *)p1;
	-(void) didPresentAlertView:(UIAlertView *)p0;
	-(BOOL) alertViewShouldEnableFirstOtherButton:(UIAlertView *)p0;
	-(void) alertView:(UIAlertView *)p0 willDismissWithButtonIndex:(void *)p1;
	-(void) willPresentAlertView:(UIAlertView *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation UIKit_UIAlertView__UIAlertViewDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) alertViewCancel:(UIAlertView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x3EF);
	}

	-(void) alertView:(UIAlertView *)p0 clickedButtonAtIndex:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_4 (self, _cmd, &managed_method, p0, p1, 0x3F1);
	}

	-(void) alertView:(UIAlertView *)p0 didDismissWithButtonIndex:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_4 (self, _cmd, &managed_method, p0, p1, 0x3F3);
	}

	-(void) didPresentAlertView:(UIAlertView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x3F5);
	}

	-(BOOL) alertViewShouldEnableFirstOtherButton:(UIAlertView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_36 (self, _cmd, &managed_method, p0, 0x3F7);
	}

	-(void) alertView:(UIAlertView *)p0 willDismissWithButtonIndex:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_4 (self, _cmd, &managed_method, p0, p1, 0x3F9);
	}

	-(void) willPresentAlertView:(UIAlertView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x3FB);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface UIKit_UIBarButtonItem_Callback : NSObject {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) InvokeAction:(NSObject *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation UIKit_UIBarButtonItem_Callback {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) InvokeAction:(NSObject *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x401);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x403);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation UIKit_UIView_UIViewAppearance {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) setBackgroundColor:(UIColor *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x409);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@implementation UIKit_UIControl_UIControlAppearance {
}
@end

@implementation __UIGestureRecognizerToken {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}

	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

@interface UIKit_UIPopoverController__UIPopoverControllerDelegate : NSObject<UIPopoverControllerDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) popoverControllerDidDismissPopover:(UIPopoverController *)p0;
	-(BOOL) popoverControllerShouldDismissPopover:(UIPopoverController *)p0;
	-(void) popoverController:(UIPopoverController *)p0 willRepositionPopoverToRect:(CGRect*)p1 inView:(UIView **)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation UIKit_UIPopoverController__UIPopoverControllerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) popoverControllerDidDismissPopover:(UIPopoverController *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x411);
	}

	-(BOOL) popoverControllerShouldDismissPopover:(UIPopoverController *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_36 (self, _cmd, &managed_method, p0, 0x413);
	}

	-(void) popoverController:(UIPopoverController *)p0 willRepositionPopoverToRect:(CGRect*)p1 inView:(UIView **)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_69 (self, _cmd, &managed_method, p0, p1, p2, 0x415);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x417);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface UIKit_UISearchBar__UISearchBarDelegate : NSObject<UIBarPositioningDelegate, UISearchBarDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) searchBarBookmarkButtonClicked:(UISearchBar *)p0;
	-(void) searchBarCancelButtonClicked:(UISearchBar *)p0;
	-(void) searchBarResultsListButtonClicked:(UISearchBar *)p0;
	-(void) searchBarTextDidBeginEditing:(UISearchBar *)p0;
	-(void) searchBarTextDidEndEditing:(UISearchBar *)p0;
	-(void) searchBarSearchButtonClicked:(UISearchBar *)p0;
	-(void) searchBar:(UISearchBar *)p0 selectedScopeButtonIndexDidChange:(void *)p1;
	-(BOOL) searchBarShouldBeginEditing:(UISearchBar *)p0;
	-(BOOL) searchBar:(UISearchBar *)p0 shouldChangeTextInRange:(NSRange)p1 replacementText:(NSString *)p2;
	-(BOOL) searchBarShouldEndEditing:(UISearchBar *)p0;
	-(void) searchBar:(UISearchBar *)p0 textDidChange:(NSString *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation UIKit_UISearchBar__UISearchBarDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) searchBarBookmarkButtonClicked:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x41D);
	}

	-(void) searchBarCancelButtonClicked:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x41F);
	}

	-(void) searchBarResultsListButtonClicked:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x421);
	}

	-(void) searchBarTextDidBeginEditing:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x423);
	}

	-(void) searchBarTextDidEndEditing:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x425);
	}

	-(void) searchBarSearchButtonClicked:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x427);
	}

	-(void) searchBar:(UISearchBar *)p0 selectedScopeButtonIndexDidChange:(void *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_4 (self, _cmd, &managed_method, p0, p1, 0x429);
	}

	-(BOOL) searchBarShouldBeginEditing:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_36 (self, _cmd, &managed_method, p0, 0x42B);
	}

	-(BOOL) searchBar:(UISearchBar *)p0 shouldChangeTextInRange:(NSRange)p1 replacementText:(NSString *)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_35 (self, _cmd, &managed_method, p0, p1, p2, 0x42D);
	}

	-(BOOL) searchBarShouldEndEditing:(UISearchBar *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_36 (self, _cmd, &managed_method, p0, 0x42F);
	}

	-(void) searchBar:(UISearchBar *)p0 textDidChange:(NSString *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_70 (self, _cmd, &managed_method, p0, p1, 0x431);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x433);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface UIKit_UITextField__UITextFieldDelegate : NSObject<UITextFieldDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) textFieldDidEndEditing:(UITextField *)p0;
	-(void) textFieldDidEndEditing:(UITextField *)p0 reason:(NSInteger)p1;
	-(void) textFieldDidBeginEditing:(UITextField *)p0;
	-(BOOL) textFieldShouldBeginEditing:(UITextField *)p0;
	-(BOOL) textField:(UITextField *)p0 shouldChangeCharactersInRange:(NSRange)p1 replacementString:(NSString *)p2;
	-(BOOL) textFieldShouldClear:(UITextField *)p0;
	-(BOOL) textFieldShouldEndEditing:(UITextField *)p0;
	-(BOOL) textFieldShouldReturn:(UITextField *)p0;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation UIKit_UITextField__UITextFieldDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) textFieldDidEndEditing:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x437);
	}

	-(void) textFieldDidEndEditing:(UITextField *)p0 reason:(NSInteger)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_71 (self, _cmd, &managed_method, p0, p1, 0x439);
	}

	-(void) textFieldDidBeginEditing:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x43B);
	}

	-(BOOL) textFieldShouldBeginEditing:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_36 (self, _cmd, &managed_method, p0, 0x43D);
	}

	-(BOOL) textField:(UITextField *)p0 shouldChangeCharactersInRange:(NSRange)p1 replacementString:(NSString *)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_35 (self, _cmd, &managed_method, p0, p1, p2, 0x43F);
	}

	-(BOOL) textFieldShouldClear:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_36 (self, _cmd, &managed_method, p0, 0x441);
	}

	-(BOOL) textFieldShouldEndEditing:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_36 (self, _cmd, &managed_method, p0, 0x443);
	}

	-(BOOL) textFieldShouldReturn:(UITextField *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_36 (self, _cmd, &managed_method, p0, 0x445);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x447);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface UIKit_UIScrollView__UIScrollViewDelegate : NSObject<UIScrollViewDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) scrollViewDidEndDecelerating:(UIScrollView *)p0;
	-(void) scrollViewWillBeginDecelerating:(UIScrollView *)p0;
	-(void) scrollViewDidChangeAdjustedContentInset:(UIScrollView *)p0;
	-(void) scrollViewDidZoom:(UIScrollView *)p0;
	-(void) scrollViewDidEndDragging:(UIScrollView *)p0 willDecelerate:(BOOL)p1;
	-(void) scrollViewWillBeginDragging:(UIScrollView *)p0;
	-(void) scrollViewDidEndScrollingAnimation:(UIScrollView *)p0;
	-(void) scrollViewDidScroll:(UIScrollView *)p0;
	-(void) scrollViewDidScrollToTop:(UIScrollView *)p0;
	-(BOOL) scrollViewShouldScrollToTop:(UIScrollView *)p0;
	-(UIView *) viewForZoomingInScrollView:(UIScrollView *)p0;
	-(void) scrollViewWillEndDragging:(UIScrollView *)p0 withVelocity:(CGPoint)p1 targetContentOffset:(CGPoint*)p2;
	-(void) scrollViewDidEndZooming:(UIScrollView *)p0 withView:(UIView *)p1 atScale:(CGFloat)p2;
	-(void) scrollViewWillBeginZooming:(UIScrollView *)p0 withView:(UIView *)p1;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation UIKit_UIScrollView__UIScrollViewDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) scrollViewDidEndDecelerating:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x44B);
	}

	-(void) scrollViewWillBeginDecelerating:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x44D);
	}

	-(void) scrollViewDidChangeAdjustedContentInset:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x44F);
	}

	-(void) scrollViewDidZoom:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x451);
	}

	-(void) scrollViewDidEndDragging:(UIScrollView *)p0 willDecelerate:(BOOL)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_20 (self, _cmd, &managed_method, p0, p1, 0x453);
	}

	-(void) scrollViewWillBeginDragging:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x455);
	}

	-(void) scrollViewDidEndScrollingAnimation:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x457);
	}

	-(void) scrollViewDidScroll:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x459);
	}

	-(void) scrollViewDidScrollToTop:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x45B);
	}

	-(BOOL) scrollViewShouldScrollToTop:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_36 (self, _cmd, &managed_method, p0, 0x45D);
	}

	-(UIView *) viewForZoomingInScrollView:(UIScrollView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_13 (self, _cmd, &managed_method, p0, 0x45F);
	}

	-(void) scrollViewWillEndDragging:(UIScrollView *)p0 withVelocity:(CGPoint)p1 targetContentOffset:(CGPoint*)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_48 (self, _cmd, &managed_method, p0, p1, p2, 0x461);
	}

	-(void) scrollViewDidEndZooming:(UIScrollView *)p0 withView:(UIView *)p1 atScale:(CGFloat)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_72 (self, _cmd, &managed_method, p0, p1, p2, 0x463);
	}

	-(void) scrollViewWillBeginZooming:(UIScrollView *)p0 withView:(UIView *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x465);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x467);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface UIKit_UITextView__UITextViewDelegate : UIKit_UIScrollView__UIScrollViewDelegate<UIScrollViewDelegate, UITextViewDelegate> {
}
	-(void) textViewDidChange:(UITextView *)p0;
	-(void) textView:(UITextView *)p0 didBeginFormattingWithViewController:(UITextFormattingViewController *)p1;
	-(void) textView:(UITextView *)p0 didEndFormattingWithViewController:(UITextFormattingViewController *)p1;
	-(void) textViewDidEndEditing:(UITextView *)p0;
	-(void) textViewDidBeginEditing:(UITextView *)p0;
	-(NSArray *) textView:(UITextView *)p0 writingToolsIgnoredRangesInEnclosingRange:(NSRange)p1;
	-(void) textViewDidChangeSelection:(UITextView *)p0;
	-(BOOL) textViewShouldBeginEditing:(UITextView *)p0;
	-(BOOL) textView:(UITextView *)p0 shouldChangeTextInRange:(NSRange)p1 replacementText:(NSString *)p2;
	-(BOOL) textViewShouldEndEditing:(UITextView *)p0;
	-(BOOL) textView:(UITextView *)p0 shouldInteractWithTextAttachment:(NSTextAttachment *)p1 inRange:(NSRange)p2;
	-(BOOL) textView:(UITextView *)p0 shouldInteractWithTextAttachment:(NSTextAttachment *)p1 inRange:(NSRange)p2 interaction:(NSInteger)p3;
	-(BOOL) textView:(UITextView *)p0 shouldInteractWithURL:(NSURL *)p1 inRange:(NSRange)p2;
	-(BOOL) textView:(UITextView *)p0 shouldInteractWithURL:(NSURL *)p1 inRange:(NSRange)p2 interaction:(NSInteger)p3;
	-(void) textView:(UITextView *)p0 willBeginFormattingWithViewController:(UITextFormattingViewController *)p1;
	-(void) textView:(UITextView *)p0 willEndFormattingWithViewController:(UITextFormattingViewController *)p1;
	-(void) textViewWritingToolsDidEnd:(UITextView *)p0;
	-(void) textViewWritingToolsWillBegin:(UITextView *)p0;
	-(BOOL) respondsToSelector:(SEL)p0;
	-(id) init;
@end

@implementation UIKit_UITextView__UITextViewDelegate {
}

	-(void) textViewDidChange:(UITextView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x46B);
	}

	-(void) textView:(UITextView *)p0 didBeginFormattingWithViewController:(UITextFormattingViewController *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x46D);
	}

	-(void) textView:(UITextView *)p0 didEndFormattingWithViewController:(UITextFormattingViewController *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x46F);
	}

	-(void) textViewDidEndEditing:(UITextView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x471);
	}

	-(void) textViewDidBeginEditing:(UITextView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x473);
	}

	-(NSArray *) textView:(UITextView *)p0 writingToolsIgnoredRangesInEnclosingRange:(NSRange)p1
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_73 (self, _cmd, &managed_method, p0, p1, 0x475);
	}

	-(void) textViewDidChangeSelection:(UITextView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x477);
	}

	-(BOOL) textViewShouldBeginEditing:(UITextView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_36 (self, _cmd, &managed_method, p0, 0x479);
	}

	-(BOOL) textView:(UITextView *)p0 shouldChangeTextInRange:(NSRange)p1 replacementText:(NSString *)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_35 (self, _cmd, &managed_method, p0, p1, p2, 0x47B);
	}

	-(BOOL) textViewShouldEndEditing:(UITextView *)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_36 (self, _cmd, &managed_method, p0, 0x47D);
	}

	-(BOOL) textView:(UITextView *)p0 shouldInteractWithTextAttachment:(NSTextAttachment *)p1 inRange:(NSRange)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_74 (self, _cmd, &managed_method, p0, p1, p2, 0x47F);
	}

	-(BOOL) textView:(UITextView *)p0 shouldInteractWithTextAttachment:(NSTextAttachment *)p1 inRange:(NSRange)p2 interaction:(NSInteger)p3
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_75 (self, _cmd, &managed_method, p0, p1, p2, p3, 0x481);
	}

	-(BOOL) textView:(UITextView *)p0 shouldInteractWithURL:(NSURL *)p1 inRange:(NSRange)p2
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_74 (self, _cmd, &managed_method, p0, p1, p2, 0x483);
	}

	-(BOOL) textView:(UITextView *)p0 shouldInteractWithURL:(NSURL *)p1 inRange:(NSRange)p2 interaction:(NSInteger)p3
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_75 (self, _cmd, &managed_method, p0, p1, p2, p3, 0x485);
	}

	-(void) textView:(UITextView *)p0 willBeginFormattingWithViewController:(UITextFormattingViewController *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x487);
	}

	-(void) textView:(UITextView *)p0 willEndFormattingWithViewController:(UITextFormattingViewController *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x489);
	}

	-(void) textViewWritingToolsDidEnd:(UITextView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x48B);
	}

	-(void) textViewWritingToolsWillBegin:(UITextView *)p0
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_3 (self, _cmd, &managed_method, p0, 0x48D);
	}

	-(BOOL) respondsToSelector:(SEL)p0
	{
		static MonoMethod *managed_method = NULL;
		return native_to_managed_trampoline_76 (self, _cmd, &managed_method, p0, 0x48F);
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x491);
		if (call_super && rv) {
			struct objc_super super = {  rv, [UIKit_UIScrollView__UIScrollViewDelegate class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@implementation UIKit_UIDatePicker_UIDatePickerAppearance {
}
@end

@interface UIKit_UITabBar__UITabBarDelegate : NSObject<UITabBarDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) tabBar:(UITabBar *)p0 didBeginCustomizingItems:(NSArray *)p1;
	-(void) tabBar:(UITabBar *)p0 didEndCustomizingItems:(NSArray *)p1 changed:(BOOL)p2;
	-(void) tabBar:(UITabBar *)p0 didSelectItem:(UITabBarItem *)p1;
	-(void) tabBar:(UITabBar *)p0 willBeginCustomizingItems:(NSArray *)p1;
	-(void) tabBar:(UITabBar *)p0 willEndCustomizingItems:(NSArray *)p1 changed:(BOOL)p2;
	-(BOOL) conformsToProtocol:(void *)p0;
	-(id) init;
@end

@implementation UIKit_UITabBar__UITabBarDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) tabBar:(UITabBar *)p0 didBeginCustomizingItems:(NSArray *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_60 (self, _cmd, &managed_method, p0, p1, 0x499);
	}

	-(void) tabBar:(UITabBar *)p0 didEndCustomizingItems:(NSArray *)p1 changed:(BOOL)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_77 (self, _cmd, &managed_method, p0, p1, p2, 0x49B);
	}

	-(void) tabBar:(UITabBar *)p0 didSelectItem:(UITabBarItem *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_8 (self, _cmd, &managed_method, p0, p1, 0x49D);
	}

	-(void) tabBar:(UITabBar *)p0 willBeginCustomizingItems:(NSArray *)p1
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_60 (self, _cmd, &managed_method, p0, p1, 0x49F);
	}

	-(void) tabBar:(UITabBar *)p0 willEndCustomizingItems:(NSArray *)p1 changed:(BOOL)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_77 (self, _cmd, &managed_method, p0, p1, p2, 0x4A1);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}

	-(id) init
	{
		static MonoMethod *managed_method = NULL;
		bool call_super = false;
		id rv = native_to_managed_trampoline_1 (self, _cmd, &managed_method, &call_super, 0x4A3);
		if (call_super && rv) {
			struct objc_super super = {  rv, [NSObject class] };
			rv = ((id (*)(objc_super*, SEL)) objc_msgSendSuper) (&super, @selector (init));
		}
		return rv;
	}
@end

@interface System_Net_Http_NSUrlSessionHandler_NSUrlSessionHandlerDelegate : NSObject<NSURLSessionDataDelegate, NSURLSessionDelegate, NSURLSessionTaskDelegate> {
}
	-(void) release;
	-(id) retain;
	-(GCHandle) xamarinGetGCHandle;
	-(bool) xamarinSetGCHandle: (GCHandle) gchandle flags: (enum XamarinGCHandleFlags) flags;
	-(enum XamarinGCHandleFlags) xamarinGetFlags;
	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags;
	-(void) URLSession:(NSURLSession *)p0 dataTask:(NSURLSessionDataTask *)p1 didReceiveResponse:(NSURLResponse *)p2 completionHandler:(void (^)(void *))p3;
	-(void) URLSession:(NSURLSession *)p0 dataTask:(NSURLSessionDataTask *)p1 didReceiveData:(NSData *)p2;
	-(void) URLSession:(NSURLSession *)p0 task:(NSURLSessionTask *)p1 didCompleteWithError:(NSError *)p2;
	-(void) URLSession:(NSURLSession *)p0 dataTask:(NSURLSessionDataTask *)p1 willCacheResponse:(NSCachedURLResponse *)p2 completionHandler:(void (^)(void *))p3;
	-(void) URLSession:(NSURLSession *)p0 task:(NSURLSessionTask *)p1 willPerformHTTPRedirection:(NSHTTPURLResponse *)p2 newRequest:(NSURLRequest *)p3 completionHandler:(void (^)(void *))p4;
	-(void) URLSession:(NSURLSession *)p0 task:(NSURLSessionTask *)p1 didReceiveChallenge:(NSURLAuthenticationChallenge *)p2 completionHandler:(void (^)(void *, void *))p3;
	-(BOOL) conformsToProtocol:(void *)p0;
@end

@implementation System_Net_Http_NSUrlSessionHandler_NSUrlSessionHandlerDelegate {
	XamarinObject __monoObjectGCHandle;
}
	-(void) release
	{
		xamarin_release_trampoline (self, _cmd);
	}

	-(id) retain
	{
		return xamarin_retain_trampoline (self, _cmd);
	}

	-(GCHandle) xamarinGetGCHandle
	{
		return __monoObjectGCHandle.gc_handle;
	}

	-(bool) xamarinSetGCHandle: (GCHandle) gc_handle flags: (enum XamarinGCHandleFlags) flags
	{
		if (((flags & XamarinGCHandleFlags_InitialSet) == XamarinGCHandleFlags_InitialSet) && __monoObjectGCHandle.gc_handle != INVALID_GCHANDLE) {
			return false;
		}
		flags = (enum XamarinGCHandleFlags) (flags & ~XamarinGCHandleFlags_InitialSet);
		__monoObjectGCHandle.gc_handle = gc_handle;
		__monoObjectGCHandle.flags = flags;
		__monoObjectGCHandle.native_object = self;
		return true;
	}

	-(enum XamarinGCHandleFlags) xamarinGetFlags
	{
		return __monoObjectGCHandle.flags;
	}

	-(void) xamarinSetFlags: (enum XamarinGCHandleFlags) flags
	{
		__monoObjectGCHandle.flags = flags;
	}


	-(void) URLSession:(NSURLSession *)p0 dataTask:(NSURLSessionDataTask *)p1 didReceiveResponse:(NSURLResponse *)p2 completionHandler:(void (^)(void *))p3
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_78 (self, _cmd, &managed_method, p0, p1, p2, p3, 0x4AD);
	}

	-(void) URLSession:(NSURLSession *)p0 dataTask:(NSURLSessionDataTask *)p1 didReceiveData:(NSData *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_45 (self, _cmd, &managed_method, p0, p1, p2, 0x4B1);
	}

	-(void) URLSession:(NSURLSession *)p0 task:(NSURLSessionTask *)p1 didCompleteWithError:(NSError *)p2
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_45 (self, _cmd, &managed_method, p0, p1, p2, 0x4B3);
	}

	-(void) URLSession:(NSURLSession *)p0 dataTask:(NSURLSessionDataTask *)p1 willCacheResponse:(NSCachedURLResponse *)p2 completionHandler:(void (^)(void *))p3
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_79 (self, _cmd, &managed_method, p0, p1, p2, p3, 0x4B5);
	}

	-(void) URLSession:(NSURLSession *)p0 task:(NSURLSessionTask *)p1 willPerformHTTPRedirection:(NSHTTPURLResponse *)p2 newRequest:(NSURLRequest *)p3 completionHandler:(void (^)(void *))p4
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_80 (self, _cmd, &managed_method, p0, p1, p2, p3, p4, 0x4B9);
	}

	-(void) URLSession:(NSURLSession *)p0 task:(NSURLSessionTask *)p1 didReceiveChallenge:(NSURLAuthenticationChallenge *)p2 completionHandler:(void (^)(void *, void *))p3
	{
		static MonoMethod *managed_method = NULL;
		native_to_managed_trampoline_81 (self, _cmd, &managed_method, p0, p1, p2, p3, 0x4BD);
	}
	-(BOOL) conformsToProtocol: (void *) protocol
	{
		GCHandle exception_gchandle;
		BOOL rv = xamarin_invoke_conforms_to_protocol (self, (Protocol *) protocol, &exception_gchandle);
		xamarin_process_managed_exception_gchandle (exception_gchandle);
		return rv;
	}
@end

	static MTClassMap __xamarin_class_map [] = {
		{ NULL, 0x1 /* #0 'NSObject' => 'Foundation.NSObject, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3 /* #1 'Microsoft_iOS__UIKit_UIApplicationDelegate' => 'UIKit.UIApplicationDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x402 /* #2 'Microsoft_Maui_MauiUIApplicationDelegate' => 'Microsoft.Maui.MauiUIApplicationDelegate, Unoapp1' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x202 /* #3 '__UnoHotRestartDelegate' => '__UnoHotRestartDelegate, Unoapp1' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xB /* #4 'UIResponder' => 'UIKit.UIResponder, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1D /* #5 'UIView' => 'UIKit.UIView, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10EB9C /* #6 'Uno_UI_Controls_BindableUIView' => 'Uno.UI.Controls.BindableUIView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x10F9C /* #7 'Microsoft_UI_Xaml_UIElement' => 'Microsoft.UI.Xaml.UIElement, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xC99C /* #8 'Microsoft_UI_Xaml_FrameworkElement' => 'Microsoft.UI.Xaml.FrameworkElement, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4E79C /* #9 'Microsoft_UI_Xaml_Controls_Control' => 'Microsoft.UI.Xaml.Controls.Control, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4CE9C /* #10 'Microsoft_UI_Xaml_Controls_ContentControl' => 'Microsoft.UI.Xaml.Controls.ContentControl, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x71A9C /* #11 'Microsoft_UI_Xaml_Controls_UserControl' => 'Microsoft.UI.Xaml.Controls.UserControl, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x60E9C /* #12 'Microsoft_UI_Xaml_Controls_Page' => 'Microsoft.UI.Xaml.Controls.Page, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x902 /* #13 'Unoapp1_SplashScreen' => 'Unoapp1.SplashScreen, Unoapp1' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xA09C /* #14 'UnoAppDelegate' => 'Microsoft.UI.Xaml.Application, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2BB02 /* #15 'UnoApp1_App' => 'UnoApp1.App, Unoapp1' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2BD02 /* #16 'UnoApp1_Pages_Registration_RegisterHomePage' => 'UnoApp1.Pages.Registration.RegisterHomePage, Unoapp1' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2BE02 /* #17 'UnoApp1_Pages_Control_HomeControlPage' => 'UnoApp1.Pages.Control.HomeControlPage, Unoapp1' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2BF02 /* #18 'UnoApp1_Pages_Authentication_EmailConfirmationPage' => 'UnoApp1.Pages.Authentication.EmailConfirmationPage, Unoapp1' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2C002 /* #19 'UnoApp1_Pages_Authentication_LoginPage' => 'UnoApp1.Pages.Authentication.LoginPage, Unoapp1' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2C102 /* #20 'UnoApp1_Pages_Authentication_SignUpPage' => 'UnoApp1.Pages.Authentication.SignUpPage, Unoapp1' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x53A /* #21 'SkiaSharp_Views_Windows_SKSwapChainPanel' => 'SkiaSharp.Views.Windows.SKSwapChainPanel, SkiaSharp.Views.Windows' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x60F9C /* #22 'Microsoft_UI_Xaml_Controls_Panel' => 'Microsoft.UI.Xaml.Controls.Panel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4AA9C /* #23 'Microsoft_UI_Xaml_Controls_Canvas' => 'Microsoft.UI.Xaml.Controls.Canvas, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x63A /* #24 'SkiaSharp_Views_Windows_SKXamlCanvas' => 'SkiaSharp.Views.Windows.SKXamlCanvas, SkiaSharp.Views.Windows' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x23 /* #25 'GLKView' => 'GLKit.GLKView, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x73A /* #26 'SkiaSharp_Views_Windows_SKGLView' => 'SkiaSharp.Views.Windows.SKGLView, SkiaSharp.Views.Windows' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x26A /* #27 'Uno_Material_Ripple' => 'Uno.Material.Ripple, Uno.Material.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2D /* #28 'Microsoft_iOS__UIKit_UIScrollViewDelegate' => 'UIKit.UIScrollViewDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1770 /* #29 'Uno_Toolkit_UI_ScrollViewDelegate' => 'Uno.Toolkit.UI.ScrollViewDelegate, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2170 /* #30 'Uno_Toolkit_UI_CardContentControl' => 'Uno.Toolkit.UI.CardContentControl, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2270 /* #31 'Uno_Toolkit_UI_Card' => 'Uno.Toolkit.UI.Card, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x91C9C /* #32 'Microsoft_UI_Xaml_Controls_Primitives_ButtonBase' => 'Microsoft.UI.Xaml.Controls.Primitives.ButtonBase, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9B39C /* #33 'Microsoft_UI_Xaml_Controls_Primitives_ToggleButton' => 'Microsoft.UI.Xaml.Controls.Primitives.ToggleButton, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2370 /* #34 'Uno_Toolkit_UI_Chip' => 'Uno.Toolkit.UI.Chip, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2E70 /* #35 'Uno_Toolkit_UI_Divider' => 'Uno.Toolkit.UI.Divider, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2F70 /* #36 'Uno_Toolkit_UI_DrawerControl' => 'Uno.Toolkit.UI.DrawerControl, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x48B9C /* #37 'Microsoft_UI_Xaml_Controls_Border' => 'Microsoft.UI.Xaml.Controls.Border, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3F70 /* #38 'Uno_Toolkit_UI_AppBarButtonWrapper' => 'Uno.Toolkit.UI.AppBarButtonWrapper, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5E70 /* #39 'Uno_Toolkit_UI_TitleView' => 'Uno.Toolkit.UI.TitleView, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7370 /* #40 'Uno_Toolkit_UI_SafeAreaPresenter' => 'Uno.Toolkit.UI.SafeAreaPresenter, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9A89C /* #41 'Microsoft_UI_Xaml_Controls_Primitives_SelectorItem' => 'Microsoft.UI.Xaml.Controls.Primitives.SelectorItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7970 /* #42 'Uno_Toolkit_UI_TabBarItem' => 'Uno.Toolkit.UI.TabBarItem, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6499C /* #43 'Microsoft_UI_Xaml_Controls_RelativePanel' => 'Microsoft.UI.Xaml.Controls.RelativePanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1970 /* #44 'Uno_Toolkit_UI_AutoLayout' => 'Uno.Toolkit.UI.AutoLayout, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x55D9C /* #45 'Microsoft_UI_Xaml_Controls_ItemsControl' => 'Microsoft.UI.Xaml.Controls.ItemsControl, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2470 /* #46 'Uno_Toolkit_UI_ChipGroup' => 'Uno.Toolkit.UI.ChipGroup, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3170 /* #47 'Uno_Toolkit_UI_DrawerFlyoutPresenter' => 'Uno.Toolkit.UI.DrawerFlyoutPresenter, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3B70 /* #48 'Uno_Toolkit_UI_LoadingView' => 'Uno.Toolkit.UI.LoadingView, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3470 /* #49 'Uno_Toolkit_UI_ExtendedSplashScreen' => 'Uno.Toolkit.UI.ExtendedSplashScreen, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3770 /* #50 'Uno_Toolkit_UI_CompositeLoadableSource' => 'Uno.Toolkit.UI.CompositeLoadableSource, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3970 /* #51 'Uno_Toolkit_UI_LoadableSource' => 'Uno.Toolkit.UI.LoadableSource, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x31 /* #52 'UIViewController' => 'UIKit.UIViewController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x4670 /* #53 'Uno_Toolkit_UI_NativeFramePresenter_PageViewController' => 'Uno.Toolkit.UI.NativeFramePresenter+PageViewController, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x33 /* #54 'UINavigationController' => 'UIKit.UINavigationController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x4770 /* #55 'Uno_Toolkit_UI_NativeFramePresenter_FrameNavigationController' => 'Uno.Toolkit.UI.NativeFramePresenter+FrameNavigationController, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x39 /* #56 'Microsoft_iOS__UIKit_UINavigationControllerDelegate' => 'UIKit.UINavigationControllerDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x4870 /* #57 'Uno_Toolkit_UI_NativeFramePresenter_ControllerDelegate' => 'Uno.Toolkit.UI.NativeFramePresenter+ControllerDelegate, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4370 /* #58 'Uno_Toolkit_UI_NativeFramePresenter' => 'Uno.Toolkit.UI.NativeFramePresenter, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4E09C /* #59 'Microsoft_UI_Xaml_Controls_ContentPresenter' => 'Microsoft.UI.Xaml.Controls.ContentPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4D70 /* #60 'Uno_Toolkit_UI_NativeNavigationBarPresenter' => 'Uno.Toolkit.UI.NativeNavigationBarPresenter, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5170 /* #61 'Uno_Toolkit_UI_NavigationBar' => 'Uno.Toolkit.UI.NavigationBar, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6070 /* #62 'Uno_Toolkit_UI_NavigationBarPresenter' => 'Uno.Toolkit.UI.NavigationBarPresenter, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6A70 /* #63 'Uno_Toolkit_UI_ResponsiveView' => 'Uno.Toolkit.UI.ResponsiveView, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6C70 /* #64 'Uno_Toolkit_UI_SafeArea' => 'Uno.Toolkit.UI.SafeArea, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7670 /* #65 'Uno_Toolkit_UI_TabBar' => 'Uno.Toolkit.UI.TabBar, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7A70 /* #66 'Uno_Toolkit_UI_TabBarListPanel' => 'Uno.Toolkit.UI.TabBarListPanel, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7D70 /* #67 'Uno_Toolkit_UI_TabBarSelectionIndicatorPresenter' => 'Uno.Toolkit.UI.TabBarSelectionIndicatorPresenter, Uno.Toolkit.WinUI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x878 /* #68 'Uno_UI_HotDesign_BaseToolWindowControl' => 'Uno.UI.HotDesign.BaseToolWindowControl, Uno.UI.HotDesign.Client.Core' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6A78 /* #69 'Uno_UI_HotDesign_Controls_ShadowControl' => 'Uno.UI.HotDesign.Controls.ShadowControl, Uno.UI.HotDesign.Client.Core' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9278 /* #70 'Uno_UI_HotDesign_Client_Core_Controls_DataTemplateBreadcrumb' => 'Uno.UI.HotDesign.Client.Core.Controls.DataTemplateBreadcrumb, Uno.UI.HotDesign.Client.Core' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9F7A /* #71 'Uno_UI_HotDesign_Client_Controls_HDMessage' => 'Uno.UI.HotDesign.Client.Controls.HDMessage, Uno.UI.HotDesign.Client' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xA27A /* #72 'Uno_UI_HotDesign_Client_Controls_ShellControlPanel' => 'Uno.UI.HotDesign.Client.Controls.ShellControlPanel, Uno.UI.HotDesign.Client' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xA47A /* #73 'Uno_UI_HotDesign_Client_Controls_ShellToolbarMenu' => 'Uno.UI.HotDesign.Client.Controls.ShellToolbarMenu, Uno.UI.HotDesign.Client' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xE7A /* #74 'Uno_UI_HotDesign_Client_HotDesignClientHost' => 'Uno.UI.HotDesign.Client.HotDesignClientHost, Uno.UI.HotDesign.Client' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x927A /* #75 'Uno_UI_HotDesign_Client_HotReload_HotReloadStatusView' => 'Uno.UI.HotDesign.Client.HotReload.HotReloadStatusView, Uno.UI.HotDesign.Client' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x977A /* #76 'Uno_UI_HotDesign_Client_Controls_Adornment' => 'Uno.UI.HotDesign.Client.Controls.Adornment, Uno.UI.HotDesign.Client' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x997A /* #77 'Uno_UI_HotDesign_Client_Controls_DataTemplateEditor' => 'Uno.UI.HotDesign.Client.Controls.DataTemplateEditor, Uno.UI.HotDesign.Client' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9B7A /* #78 'Uno_UI_HotDesign_Client_Controls_DesignerOverlay' => 'Uno.UI.HotDesign.Client.Controls.DesignerOverlay, Uno.UI.HotDesign.Client' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9E7A /* #79 'Uno_UI_HotDesign_Client_Controls_EntryButton' => 'Uno.UI.HotDesign.Client.Controls.EntryButton, Uno.UI.HotDesign.Client' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xA77A /* #80 'Uno_UI_HotDesign_Client_Controls_ZoomContentControl' => 'Uno.UI.HotDesign.Client.Controls.ZoomContentControl, Uno.UI.HotDesign.Client' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xAA7A /* #81 'Uno_UI_HotDesign_Client_Adorners_AdornersLayer' => 'Uno.UI.HotDesign.Client.Adorners.AdornersLayer, Uno.UI.HotDesign.Client' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xE7C /* #82 'Uno_UI_HotDesign_CommunityToolkit_Controls_SizerBase' => 'Uno.UI.HotDesign.CommunityToolkit.Controls.SizerBase, Uno.UI.HotDesign.CommunityToolkit' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5149C /* #83 'Microsoft_UI_Xaml_Controls_Grid' => 'Microsoft.UI.Xaml.Controls.Grid, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xC7C /* #84 'Uno_UI_HotDesign_CommunityToolkit_Controls_UniformGrid' => 'Uno.UI.HotDesign.CommunityToolkit.Controls.UniformGrid, Uno.UI.HotDesign.CommunityToolkit' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xD7C /* #85 'Uno_UI_HotDesign_CommunityToolkit_Controls_GridSplitter' => 'Uno.UI.HotDesign.CommunityToolkit.Controls.GridSplitter, Uno.UI.HotDesign.CommunityToolkit' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x77E /* #86 'Uno_UI_HotDesign_Hierarchy_HierarchyView' => 'Uno.UI.HotDesign.Hierarchy.HierarchyView, Uno.UI.HotDesign.Hierarchy' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1E82 /* #87 'Uno_UI_HotDesign_PropertyGrid_PropertySearchBar' => 'Uno.UI.HotDesign.PropertyGrid.PropertySearchBar, Uno.UI.HotDesign.PropertyGrid' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2082 /* #88 'Uno_UI_HotDesign_PropertyGrid_SelectionBreadcrumb' => 'Uno.UI.HotDesign.PropertyGrid.SelectionBreadcrumb, Uno.UI.HotDesign.PropertyGrid' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1782 /* #89 'Uno_UI_HotDesign_PropertyGrid_AdvancedPropertyEditor' => 'Uno.UI.HotDesign.PropertyGrid.AdvancedPropertyEditor, Uno.UI.HotDesign.PropertyGrid' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1B82 /* #90 'Uno_UI_HotDesign_PropertyGrid_CollectionEditor' => 'Uno.UI.HotDesign.PropertyGrid.CollectionEditor, Uno.UI.HotDesign.PropertyGrid' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1C82 /* #91 'Uno_UI_HotDesign_PropertyGrid_IdentityProperties' => 'Uno.UI.HotDesign.PropertyGrid.IdentityProperties, Uno.UI.HotDesign.PropertyGrid' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2282 /* #92 'Uno_UI_HotDesign_PropertyGrid_SelectionProperties' => 'Uno.UI.HotDesign.PropertyGrid.SelectionProperties, Uno.UI.HotDesign.PropertyGrid' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4D09C /* #93 'Microsoft_UI_Xaml_Controls_ContentDialog' => 'Microsoft.UI.Xaml.Controls.ContentDialog, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4182 /* #94 'Uno_UI_HotDesign_PropertyGrid_PropertyFlyout' => 'Uno.UI.HotDesign.PropertyGrid.PropertyFlyout, Uno.UI.HotDesign.PropertyGrid' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4382 /* #95 'Uno_UI_HotDesign_PropertyGrid_PropertyGridCell' => 'Uno.UI.HotDesign.PropertyGrid.PropertyGridCell, Uno.UI.HotDesign.PropertyGrid' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4682 /* #96 'Uno_UI_HotDesign_PropertyGrid_PropertyGridView' => 'Uno.UI.HotDesign.PropertyGrid.PropertyGridView, Uno.UI.HotDesign.PropertyGrid' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7182 /* #97 'Uno_UI_HotDesign_PropertyGrid_Editors_CornerRadiusEditor' => 'Uno.UI.HotDesign.PropertyGrid.Editors.CornerRadiusEditor, Uno.UI.HotDesign.PropertyGrid' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7282 /* #98 'Uno_UI_HotDesign_PropertyGrid_Editors_GridDefinitionsEditor' => 'Uno.UI.HotDesign.PropertyGrid.Editors.GridDefinitionsEditor, Uno.UI.HotDesign.PropertyGrid' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xE84 /* #99 'Uno_UI_HotDesign_Toolbox_ToolboxView' => 'Uno.UI.HotDesign.Toolbox.ToolboxView, Uno.UI.HotDesign.Toolbox' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x129A /* #100 'Uno_UI_Toolkit_ElevatedView' => 'Uno.UI.Toolkit.ElevatedView, Uno.UI.Toolkit' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x29A /* #101 'Uno_Diagnostics_UI_DiagnosticsOverlay' => 'Uno.Diagnostics.UI.DiagnosticsOverlay, Uno.UI.Toolkit' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1729C /* #102 'Microsoft_UI_Xaml_DragRoot' => 'Microsoft.UI.Xaml.DragRoot, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1739C /* #103 'Microsoft_UI_Xaml_DragView' => 'Microsoft.UI.Xaml.DragView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1F89C /* #104 'Microsoft_UI_Xaml_Shapes_Shape' => 'Microsoft.UI.Xaml.Shapes.Shape, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1EE9C /* #105 'Microsoft_UI_Xaml_Shapes_Ellipse' => 'Microsoft.UI.Xaml.Shapes.Ellipse, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1EF9C /* #106 'Microsoft_UI_Xaml_Shapes_Line' => 'Microsoft.UI.Xaml.Shapes.Line, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1F09C /* #107 'Microsoft_UI_Xaml_Shapes_Path' => 'Microsoft.UI.Xaml.Shapes.Path, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1F79C /* #108 'Microsoft_UI_Xaml_Shapes_Rectangle' => 'Microsoft.UI.Xaml.Shapes.Rectangle, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x2939C /* #109 'Microsoft_UI_Xaml_Documents_Glyphs' => 'Microsoft.UI.Xaml.Documents.Glyphs, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4729C /* #110 'Microsoft_UI_Xaml_Controls_AnimatedVisualPlayer' => 'Microsoft.UI.Xaml.Controls.AnimatedVisualPlayer, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4739C /* #111 'Microsoft_UI_Xaml_Controls_AnnotatedScrollBar' => 'Microsoft.UI.Xaml.Controls.AnnotatedScrollBar, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x47D9C /* #112 'Microsoft_UI_Xaml_Controls_AppBarElementContainer' => 'Microsoft.UI.Xaml.Controls.AppBarElementContainer, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x47E9C /* #113 'Microsoft_UI_Xaml_Controls_AppBarSeparator' => 'Microsoft.UI.Xaml.Controls.AppBarSeparator, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x47F9C /* #114 'Microsoft_UI_Xaml_Controls_AppBarToggleButton' => 'Microsoft.UI.Xaml.Controls.AppBarToggleButton, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4979C /* #115 'Microsoft_UI_Xaml_Controls_Button' => 'Microsoft.UI.Xaml.Controls.Button, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4AC9C /* #116 'Microsoft_UI_Xaml_Controls_CheckBox' => 'Microsoft.UI.Xaml.Controls.CheckBox, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4C59C /* #117 'Microsoft_UI_Xaml_Controls_ComboBoxItem' => 'Microsoft.UI.Xaml.Controls.ComboBoxItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4F99C /* #118 'Microsoft_UI_Xaml_Controls_DatePickerFlyoutPresenter' => 'Microsoft.UI.Xaml.Controls.DatePickerFlyoutPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4FF9C /* #119 'Microsoft_UI_Xaml_Controls_DropDownButton' => 'Microsoft.UI.Xaml.Controls.DropDownButton, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9A59C /* #120 'Microsoft_UI_Xaml_Controls_Primitives_Selector' => 'Microsoft.UI.Xaml.Controls.Primitives.Selector, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5089C /* #121 'Microsoft_UI_Xaml_Controls_FlipView' => 'Microsoft.UI.Xaml.Controls.FlipView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5099C /* #122 'Microsoft_UI_Xaml_Controls_FlipViewItem' => 'Microsoft.UI.Xaml.Controls.FlipViewItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x50B9C /* #123 'Microsoft_UI_Xaml_Controls_FlyoutPresenter' => 'Microsoft.UI.Xaml.Controls.FlyoutPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5969C /* #124 'Microsoft_UI_Xaml_Controls_ListViewBase' => 'Microsoft.UI.Xaml.Controls.ListViewBase, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5209C /* #125 'Microsoft_UI_Xaml_Controls_GridView' => 'Microsoft.UI.Xaml.Controls.GridView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5A69C /* #126 'Microsoft_UI_Xaml_Controls_ListViewBaseHeaderItem' => 'Microsoft.UI.Xaml.Controls.ListViewBaseHeaderItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5219C /* #127 'Microsoft_UI_Xaml_Controls_GridViewHeaderItem' => 'Microsoft.UI.Xaml.Controls.GridViewHeaderItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5229C /* #128 'Microsoft_UI_Xaml_Controls_GridViewItem' => 'Microsoft.UI.Xaml.Controls.GridViewItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5239C /* #129 'Microsoft_UI_Xaml_Controls_GroupItem' => 'Microsoft.UI.Xaml.Controls.GroupItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5269C /* #130 'Microsoft_UI_Xaml_Controls_Hub' => 'Microsoft.UI.Xaml.Controls.Hub, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5279C /* #131 'Microsoft_UI_Xaml_Controls_HubSection' => 'Microsoft.UI.Xaml.Controls.HubSection, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8469C /* #132 'Microsoft_UI_Xaml_Controls_IconElement' => 'Microsoft.UI.Xaml.Controls.IconElement, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5429C /* #133 'Microsoft_UI_Xaml_Controls_ImageIcon' => 'Microsoft.UI.Xaml.Controls.ImageIcon, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5469C /* #134 'Microsoft_UI_Xaml_Controls_InfoBadge' => 'Microsoft.UI.Xaml.Controls.InfoBadge, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5499C /* #135 'Microsoft_UI_Xaml_Controls_InfoBar' => 'Microsoft.UI.Xaml.Controls.InfoBar, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5909C /* #136 'Microsoft_UI_Xaml_Controls_ListBox' => 'Microsoft.UI.Xaml.Controls.ListBox, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5919C /* #137 'Microsoft_UI_Xaml_Controls_ListBoxItem' => 'Microsoft.UI.Xaml.Controls.ListBoxItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5939C /* #138 'Microsoft_UI_Xaml_Controls_ListPickerFlyoutPresenter' => 'Microsoft.UI.Xaml.Controls.ListPickerFlyoutPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5959C /* #139 'Microsoft_UI_Xaml_Controls_ListView' => 'Microsoft.UI.Xaml.Controls.ListView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5A79C /* #140 'Microsoft_UI_Xaml_Controls_ListViewHeaderItem' => 'Microsoft.UI.Xaml.Controls.ListViewHeaderItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5A89C /* #141 'Microsoft_UI_Xaml_Controls_ListViewItem' => 'Microsoft.UI.Xaml.Controls.ListViewItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5AA9C /* #142 'Microsoft_UI_Xaml_Controls_MapControl' => 'Microsoft.UI.Xaml.Controls.MapControl, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5CF9C /* #143 'Microsoft_UI_Xaml_Controls_MenuBar' => 'Microsoft.UI.Xaml.Controls.MenuBar, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5DE9C /* #144 'Microsoft_UI_Xaml_Controls_MenuFlyoutItemBase' => 'Microsoft.UI.Xaml.Controls.MenuFlyoutItemBase, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5E19C /* #145 'Microsoft_UI_Xaml_Controls_MenuFlyoutSeparator' => 'Microsoft.UI.Xaml.Controls.MenuFlyoutSeparator, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5FD9C /* #146 'Microsoft_UI_Xaml_Controls_NavigationViewItemBase' => 'Microsoft.UI.Xaml.Controls.NavigationViewItemBase, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6009C /* #147 'Microsoft_UI_Xaml_Controls_NavigationViewItemHeader' => 'Microsoft.UI.Xaml.Controls.NavigationViewItemHeader, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6029C /* #148 'Microsoft_UI_Xaml_Controls_NavigationViewItemSeparator' => 'Microsoft.UI.Xaml.Controls.NavigationViewItemSeparator, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6119C /* #149 'Microsoft_UI_Xaml_Controls_ParallaxView' => 'Microsoft.UI.Xaml.Controls.ParallaxView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6199C /* #150 'Microsoft_UI_Xaml_Controls_PersonPicture' => 'Microsoft.UI.Xaml.Controls.PersonPicture, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x61E9C /* #151 'Microsoft_UI_Xaml_Controls_PickerFlyoutPresenter' => 'Microsoft.UI.Xaml.Controls.PickerFlyoutPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x62B9C /* #152 'Microsoft_UI_Xaml_Controls_PivotItem' => 'Microsoft.UI.Xaml.Controls.PivotItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9829C /* #153 'Microsoft_UI_Xaml_Controls_Primitives_RangeBase' => 'Microsoft.UI.Xaml.Controls.Primitives.RangeBase, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x62F9C /* #154 'Microsoft_UI_Xaml_Controls_ProgressBar' => 'Microsoft.UI.Xaml.Controls.ProgressBar, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6379C /* #155 'Microsoft_UI_Xaml_Controls_RadioButton' => 'Microsoft.UI.Xaml.Controls.RadioButton, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6489C /* #156 'Microsoft_UI_Xaml_Controls_RefreshVisualizer' => 'Microsoft.UI.Xaml.Controls.RefreshVisualizer, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9629C /* #157 'Microsoft_UI_Xaml_Controls_Primitives_ListViewItemPresenter' => 'Microsoft.UI.Xaml.Controls.Primitives.ListViewItemPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x64E9C /* #158 'Microsoft_UI_Xaml_Controls_RevealListViewItemPresenter' => 'Microsoft.UI.Xaml.Controls.RevealListViewItemPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x64F9C /* #159 'Microsoft_UI_Xaml_Controls_RichEditBox' => 'Microsoft.UI.Xaml.Controls.RichEditBox, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6539C /* #160 'Microsoft_UI_Xaml_Controls_RichTextBlock' => 'Microsoft.UI.Xaml.Controls.RichTextBlock, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6549C /* #161 'Microsoft_UI_Xaml_Controls_RichTextBlockOverflow' => 'Microsoft.UI.Xaml.Controls.RichTextBlockOverflow, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x65A9C /* #162 'Microsoft_UI_Xaml_Controls_ScrollContentPresenter' => 'Microsoft.UI.Xaml.Controls.ScrollContentPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6749C /* #163 'Microsoft_UI_Xaml_Controls_SelectorBar' => 'Microsoft.UI.Xaml.Controls.SelectorBar, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x55A9C /* #164 'Microsoft_UI_Xaml_Controls_ItemContainer' => 'Microsoft.UI.Xaml.Controls.ItemContainer, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6759C /* #165 'Microsoft_UI_Xaml_Controls_SelectorBarItem' => 'Microsoft.UI.Xaml.Controls.SelectorBarItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6779C /* #166 'Microsoft_UI_Xaml_Controls_SemanticZoom' => 'Microsoft.UI.Xaml.Controls.SemanticZoom, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6939C /* #167 'Microsoft_UI_Xaml_Controls_SwapChainBackgroundPanel' => 'Microsoft.UI.Xaml.Controls.SwapChainBackgroundPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6949C /* #168 'Microsoft_UI_Xaml_Controls_SwapChainPanel' => 'Microsoft.UI.Xaml.Controls.SwapChainPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6B89C /* #169 'Microsoft_UI_Xaml_Controls_TabViewItem' => 'Microsoft.UI.Xaml.Controls.TabViewItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6F59C /* #170 'Microsoft_UI_Xaml_Controls_TimePickerFlyoutPresenter' => 'Microsoft.UI.Xaml.Controls.TimePickerFlyoutPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x67F9C /* #171 'Microsoft_UI_Xaml_Controls_SplitButton' => 'Microsoft.UI.Xaml.Controls.SplitButton, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6FA9C /* #172 'Microsoft_UI_Xaml_Controls_ToggleSplitButton' => 'Microsoft.UI.Xaml.Controls.ToggleSplitButton, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6FF9C /* #173 'Microsoft_UI_Xaml_Controls_ToolTip' => 'Microsoft.UI.Xaml.Controls.ToolTip, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7049C /* #174 'Microsoft_UI_Xaml_Controls_TreeView' => 'Microsoft.UI.Xaml.Controls.TreeView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x71F9C /* #175 'Microsoft_UI_Xaml_Controls_Viewbox' => 'Microsoft.UI.Xaml.Controls.Viewbox, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7239C /* #176 'Microsoft_UI_Xaml_Controls_VirtualizingPanel' => 'Microsoft.UI.Xaml.Controls.VirtualizingPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9799C /* #177 'Microsoft_UI_Xaml_Controls_Primitives_OrientedVirtualizingPanel' => 'Microsoft.UI.Xaml.Controls.Primitives.OrientedVirtualizingPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7249C /* #178 'Microsoft_UI_Xaml_Controls_VirtualizingStackPanel' => 'Microsoft.UI.Xaml.Controls.VirtualizingStackPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7279C /* #179 'Microsoft_UI_Xaml_Controls_WrapGrid' => 'Microsoft.UI.Xaml.Controls.WrapGrid, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6D49C /* #180 'Microsoft_UI_Xaml_Controls_TextBlock' => 'Microsoft.UI.Xaml.Controls.TextBlock, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8299C /* #181 'Microsoft_UI_Xaml_Controls_ImplicitTextBlock' => 'Microsoft.UI.Xaml.Controls.ImplicitTextBlock, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9C89C /* #182 'Microsoft_UI_Xaml_Controls_Primitives_PopupPanel' => 'Microsoft.UI.Xaml.Controls.Primitives.PopupPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x82C9C /* #183 'Microsoft_UI_Xaml_Controls_ContentDialogPopupPanel' => 'Microsoft.UI.Xaml.Controls.ContentDialogPopupPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8389C /* #184 'Microsoft_UI_Xaml_Controls_NativeDatePickerFlyoutPresenter' => 'Microsoft.UI.Xaml.Controls.NativeDatePickerFlyoutPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x45 /* #185 'Microsoft_iOS__UIKit_UICollectionViewSource' => 'UIKit.UICollectionViewSource, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x83A9C /* #186 'Microsoft_UI_Xaml_Controls_FlipViewSource' => 'Microsoft.UI.Xaml.Controls.FlipViewSource, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x49 /* #187 'UIScrollView' => 'UIKit.UIScrollView, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x4B /* #188 'UICollectionView' => 'UIKit.UICollectionView, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x83C9C /* #189 'Microsoft_UI_Xaml_Controls_PagedCollectionView' => 'Microsoft.UI.Xaml.Controls.PagedCollectionView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x83B9C /* #190 'Microsoft_UI_Xaml_Controls_NativeFlipView' => 'Microsoft.UI.Xaml.Controls.NativeFlipView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x83F9C /* #191 'Microsoft_UI_Xaml_Controls_FlyoutBasePopupPanel' => 'Microsoft.UI.Xaml.Controls.FlyoutBasePopupPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8429C /* #192 'Microsoft_UI_Xaml_Controls_PickerFlyoutPopupPanel' => 'Microsoft.UI.Xaml.Controls.PickerFlyoutPopupPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4D /* #193 'UIImageView' => 'UIKit.UIImageView, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x84B9C /* #194 'Microsoft_UI_Xaml_Controls_NativeImageView' => 'Microsoft.UI.Xaml.Controls.NativeImageView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4F /* #195 'UICollectionViewLayout' => 'UIKit.UICollectionViewLayout, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x87F9C /* #196 'Microsoft_UI_Xaml_Controls_VirtualizingPanelLayout' => 'Microsoft.UI.Xaml.Controls.VirtualizingPanelLayout, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8519C /* #197 'Microsoft_UI_Xaml_Controls_ItemsStackPanelLayout' => 'Microsoft.UI.Xaml.Controls.ItemsStackPanelLayout, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8629C /* #198 'Microsoft_UI_Xaml_Controls_ListViewBaseScrollContentPresenter' => 'Microsoft.UI.Xaml.Controls.ListViewBaseScrollContentPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x51 /* #199 'UICollectionReusableView' => 'UIKit.UICollectionReusableView, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x53 /* #200 'UICollectionViewCell' => 'UIKit.UICollectionViewCell, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8689C /* #201 'Microsoft_UI_Xaml_Controls_ListViewBaseInternalContainer' => 'Microsoft.UI.Xaml.Controls.ListViewBaseInternalContainer, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8699C /* #202 'Microsoft_UI_Xaml_Controls_BlockLayout' => 'Microsoft.UI.Xaml.Controls.BlockLayout, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x87C9C /* #203 'Microsoft_UI_Xaml_Controls_UnsetLayout' => 'Microsoft.UI.Xaml.Controls.UnsetLayout, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x89B9C /* #204 'Microsoft_UI_Xaml_Controls_NativePage' => 'Microsoft.UI.Xaml.Controls.NativePage, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8A79C /* #205 'Microsoft_UI_Xaml_Controls_PickerItem' => 'Microsoft.UI.Xaml.Controls.PickerItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5D /* #206 'Microsoft_iOS__UIKit_UIPickerViewModel' => 'UIKit.UIPickerViewModel, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8A89C /* #207 'Microsoft_UI_Xaml_Controls_PickerModel' => 'Microsoft.UI.Xaml.Controls.PickerModel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x97E9C /* #208 'Microsoft_UI_Xaml_Controls_Primitives_Popup' => 'Microsoft.UI.Xaml.Controls.Primitives.Popup, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8AD9C /* #209 'Microsoft_UI_Xaml_Controls_NativePopupBase' => 'Microsoft.UI.Xaml.Controls.NativePopupBase, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8AC9C /* #210 'Microsoft_UI_Xaml_Controls_Popover' => 'Microsoft.UI.Xaml.Controls.Popover, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x65 /* #211 'Microsoft_iOS__UIKit_UITextViewDelegate' => 'UIKit.UITextViewDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8C89C /* #212 'Microsoft_UI_Xaml_Controls_MultilineTextBoxDelegate' => 'Microsoft.UI.Xaml.Controls.MultilineTextBoxDelegate, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8EB9C /* #213 'Microsoft_UI_Xaml_Controls_NativeTimePickerFlyoutPresenter' => 'Microsoft.UI.Xaml.Controls.NativeTimePickerFlyoutPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6D /* #214 'Microsoft_iOS__WebKit_WKUIDelegate' => 'WebKit.WKUIDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8F09C /* #215 'Microsoft_UI_Xaml_Controls_LocalWKUIDelegate' => 'Microsoft.UI.Xaml.Controls.LocalWKUIDelegate, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x77 /* #216 'WKWebView' => 'WebKit.WKWebView, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8F29C /* #217 'Microsoft_UI_Xaml_Controls_UnoWKWebView' => 'Microsoft.UI.Xaml.Controls.UnoWKWebView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8F19C /* #218 'Microsoft_UI_Xaml_Controls_NativeWebView' => 'Microsoft.UI.Xaml.Controls.NativeWebView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x90A9C /* #219 'Microsoft_UI_Xaml_Controls_WindowView' => 'Microsoft.UI.Xaml.Controls.WindowView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x90D9C /* #220 'Microsoft_UI_Xaml_Controls_WrapPanel' => 'Microsoft.UI.Xaml.Controls.WrapPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x68E9C /* #221 'Microsoft_UI_Xaml_Controls_StackPanel' => 'Microsoft.UI.Xaml.Controls.StackPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9309C /* #222 'Microsoft_UI_Xaml_Controls_Primitives_CarouselPanel' => 'Microsoft.UI.Xaml.Controls.Primitives.CarouselPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x67B9C /* #223 'Microsoft_UI_Xaml_Controls_Slider' => 'Microsoft.UI.Xaml.Controls.Slider, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9319C /* #224 'Microsoft_UI_Xaml_Controls_Primitives_ColorPickerSlider' => 'Microsoft.UI.Xaml.Controls.Primitives.ColorPickerSlider, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4779C /* #225 'Microsoft_UI_Xaml_Controls_AppBar' => 'Microsoft.UI.Xaml.Controls.AppBar, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4C79C /* #226 'Microsoft_UI_Xaml_Controls_CommandBar' => 'Microsoft.UI.Xaml.Controls.CommandBar, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x93B9C /* #227 'Microsoft_UI_Xaml_Controls_Primitives_CommandBarFlyoutCommandBar' => 'Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBar, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9549C /* #228 'Microsoft_UI_Xaml_Controls_Primitives_GridViewItemPresenter' => 'Microsoft.UI.Xaml.Controls.Primitives.GridViewItemPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9579C /* #229 'Microsoft_UI_Xaml_Controls_Primitives_InfoBarPanel' => 'Microsoft.UI.Xaml.Controls.Primitives.InfoBarPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x96F9C /* #230 'Microsoft_UI_Xaml_Controls_Primitives_LoopingSelectorPanel' => 'Microsoft.UI.Xaml.Controls.Primitives.LoopingSelectorPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9749C /* #231 'Microsoft_UI_Xaml_Controls_Primitives_MonochromaticOverlayPresenter' => 'Microsoft.UI.Xaml.Controls.Primitives.MonochromaticOverlayPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x97B9C /* #232 'Microsoft_UI_Xaml_Controls_Primitives_PivotHeaderItem' => 'Microsoft.UI.Xaml.Controls.Primitives.PivotHeaderItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x97C9C /* #233 'Microsoft_UI_Xaml_Controls_Primitives_PivotHeaderPanel' => 'Microsoft.UI.Xaml.Controls.Primitives.PivotHeaderPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x97D9C /* #234 'Microsoft_UI_Xaml_Controls_Primitives_PivotPanel' => 'Microsoft.UI.Xaml.Controls.Primitives.PivotPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9859C /* #235 'Microsoft_UI_Xaml_Controls_Primitives_RepeatButton' => 'Microsoft.UI.Xaml.Controls.Primitives.RepeatButton, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9B09C /* #236 'Microsoft_UI_Xaml_Controls_Primitives_TabViewListView' => 'Microsoft.UI.Xaml.Controls.Primitives.TabViewListView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9B19C /* #237 'Microsoft_UI_Xaml_Controls_Primitives_Thumb' => 'Microsoft.UI.Xaml.Controls.Primitives.Thumb, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9B29C /* #238 'Microsoft_UI_Xaml_Controls_Primitives_TickBar' => 'Microsoft.UI.Xaml.Controls.Primitives.TickBar, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xFAC9C /* #239 'Uno_UI_Xaml_Islands_XamlIsland' => 'Uno.UI.Xaml.Islands.XamlIsland, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xFAD9C /* #240 'Uno_UI_Xaml_Islands_XamlIslandRootCollection' => 'Uno.UI.Xaml.Islands.XamlIslandRootCollection, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xFC19C /* #241 'Uno_UI_Xaml_Core_FullWindowMediaRoot' => 'Uno.UI.Xaml.Core.FullWindowMediaRoot, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xFCE9C /* #242 'Uno_UI_Xaml_Core_RootVisual' => 'Uno.UI.Xaml.Core.RootVisual, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7D /* #243 'UIControl' => 'UIKit.UIControl, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x7F /* #244 'UIRefreshControl' => 'UIKit.UIRefreshControl, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x100C9C /* #245 'Uno_UI_Xaml_Controls_NativeRefreshControl' => 'Uno.UI.Xaml.Controls.NativeRefreshControl, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x100E9C /* #246 'Uno_UI_Xaml_Controls_NativeRefreshVisualizer' => 'Uno.UI.Xaml.Controls.NativeRefreshVisualizer, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x100F9C /* #247 'Uno_UI_Xaml_Controls_ProgressRingRefreshVisualizer' => 'Uno.UI.Xaml.Controls.ProgressRingRefreshVisualizer, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x10349C /* #248 'Uno_UI_Xaml_Controls_WindowChrome' => 'Uno.UI.Xaml.Controls.WindowChrome, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x81 /* #249 'Microsoft_iOS__UIKit_UIGestureRecognizerDelegate' => 'UIKit.UIGestureRecognizerDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10409C /* #250 'Uno_UI_Helpers_NativeFramePresenterUIGestureRecognizerDelegate' => 'Uno.UI.Helpers.NativeFramePresenterUIGestureRecognizerDelegate, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x10DF9C /* #251 'Uno_UI_Views_Controls_DataTemplateSelectorControl' => 'Uno.UI.Views.Controls.DataTemplateSelectorControl, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x10EF9C /* #252 'Uno_UI_Controls_AppBarButtonWrapper' => 'Uno.UI.Controls.AppBarButtonWrapper, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x10FA9C /* #253 'Uno_UI_Controls_TitleView' => 'Uno.UI.Controls.TitleView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x11069C /* #254 'Uno_UI_Controls_LineView' => 'Uno.UI.Controls.LineView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x85 /* #255 'Microsoft_iOS__UIKit_UIViewControllerTransitioningDelegate' => 'UIKit.UIViewControllerTransitioningDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x111C9C /* #256 'Uno_UI_Controls_ViewControllerTransitioningDeligate' => 'Uno.UI.Controls.ViewControllerTransitioningDeligate, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x10E59C /* #257 'Uno_UI_Views_Controls_BindableUICollectionView' => 'Uno.UI.Views.Controls.BindableUICollectionView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x11299C /* #258 'Uno_UI_Controls_Legacy_ListViewBase' => 'Uno.UI.Controls.Legacy.ListViewBase, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x11239C /* #259 'Uno_UI_Controls_Legacy_GridView' => 'Uno.UI.Controls.Legacy.GridView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x11399C /* #260 'Uno_UI_Controls_Legacy_ListViewBaseSource' => 'Uno.UI.Controls.Legacy.ListViewBaseSource, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x11249C /* #261 'Uno_UI_Controls_Legacy_GridViewSource' => 'Uno.UI.Controls.Legacy.GridViewSource, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x11279C /* #262 'Uno_UI_Controls_Legacy_ListView' => 'Uno.UI.Controls.Legacy.ListView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x11429C /* #263 'Uno_UI_Controls_Legacy_ListViewSource' => 'Uno.UI.Controls.Legacy.ListViewSource, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x89 /* #264 'UIActivityIndicatorView' => 'UIKit.UIActivityIndicatorView, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10D39C /* #265 'Uno_UI_Views_Controls_BindableUIActivityIndicatorView' => 'Uno.UI.Views.Controls.BindableUIActivityIndicatorView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x11439C /* #266 'Uno_UI_Controls_Legacy_NativeProgressRing' => 'Uno.UI.Controls.Legacy.NativeProgressRing, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x11449C /* #267 'Uno_UI_Controls_Legacy_ProgressRing' => 'Uno.UI.Controls.Legacy.ProgressRing, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1779C /* #268 'Microsoft_UI_Xaml_ElementStub' => 'Microsoft.UI.Xaml.ElementStub, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1F19C /* #269 'Microsoft_UI_Xaml_Shapes_Polygon' => 'Microsoft.UI.Xaml.Shapes.Polygon, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x1F49C /* #270 'Microsoft_UI_Xaml_Shapes_Polyline' => 'Microsoft.UI.Xaml.Shapes.Polyline, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8B /* #271 'CALayer' => 'CoreAnimation.CALayer, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3929C /* #272 'Microsoft_UI_Xaml_Media_RadialGradientBrush_RadialGradientLayer' => 'Microsoft.UI.Xaml.Media.RadialGradientBrush+RadialGradientLayer, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x46A9C /* #273 'Microsoft_UI_Xaml_Controls_AnimatedIcon' => 'Microsoft.UI.Xaml.Controls.AnimatedIcon, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x47A9C /* #274 'Microsoft_UI_Xaml_Controls_AppBarButton' => 'Microsoft.UI.Xaml.Controls.AppBarButton, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4809C /* #275 'Microsoft_UI_Xaml_Controls_AutoSuggestBox' => 'Microsoft.UI.Xaml.Controls.AutoSuggestBox, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4889C /* #276 'Microsoft_UI_Xaml_Controls_BitmapIcon' => 'Microsoft.UI.Xaml.Controls.BitmapIcon, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x48F9C /* #277 'Microsoft_UI_Xaml_Controls_BreadcrumbBar' => 'Microsoft.UI.Xaml.Controls.BreadcrumbBar, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4919C /* #278 'Microsoft_UI_Xaml_Controls_BreadcrumbBarItem' => 'Microsoft.UI.Xaml.Controls.BreadcrumbBarItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4989C /* #279 'Microsoft_UI_Xaml_Controls_CalendarDatePicker' => 'Microsoft.UI.Xaml.Controls.CalendarDatePicker, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x49B9C /* #280 'Microsoft_UI_Xaml_Controls_CalendarView' => 'Microsoft.UI.Xaml.Controls.CalendarView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8049C /* #281 'Microsoft_UI_Xaml_Controls_CalendarViewBaseItem' => 'Microsoft.UI.Xaml.Controls.CalendarViewBaseItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4A39C /* #282 'Microsoft_UI_Xaml_Controls_CalendarViewDayItem' => 'Microsoft.UI.Xaml.Controls.CalendarViewDayItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4B29C /* #283 'Microsoft_UI_Xaml_Controls_ColorPicker' => 'Microsoft.UI.Xaml.Controls.ColorPicker, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4BF9C /* #284 'Microsoft_UI_Xaml_Controls_ComboBox' => 'Microsoft.UI.Xaml.Controls.ComboBox, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4CB9C /* #285 'Microsoft_UI_Xaml_Controls_CommandBarOverflowPresenter' => 'Microsoft.UI.Xaml.Controls.CommandBarOverflowPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4F19C /* #286 'Microsoft_UI_Xaml_Controls_DatePicker' => 'Microsoft.UI.Xaml.Controls.DatePicker, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5019C /* #287 'Microsoft_UI_Xaml_Controls_Expander' => 'Microsoft.UI.Xaml.Controls.Expander, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x50E9C /* #288 'Microsoft_UI_Xaml_Controls_FontIcon' => 'Microsoft.UI.Xaml.Controls.FontIcon, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5119C /* #289 'Microsoft_UI_Xaml_Controls_Frame' => 'Microsoft.UI.Xaml.Controls.Frame, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x52A9C /* #290 'Microsoft_UI_Xaml_Controls_HyperlinkButton' => 'Microsoft.UI.Xaml.Controls.HyperlinkButton, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5339C /* #291 'Microsoft_UI_Xaml_Controls_IconSourceElement' => 'Microsoft.UI.Xaml.Controls.IconSourceElement, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5389C /* #292 'Microsoft_UI_Xaml_Controls_Image' => 'Microsoft.UI.Xaml.Controls.Image, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x56A9C /* #293 'Microsoft_UI_Xaml_Controls_ItemsPresenter' => 'Microsoft.UI.Xaml.Controls.ItemsPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x56F9C /* #294 'Microsoft_UI_Xaml_Controls_ItemsRepeater' => 'Microsoft.UI.Xaml.Controls.ItemsRepeater, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5749C /* #295 'Microsoft_UI_Xaml_Controls_ItemsRepeaterScrollHost' => 'Microsoft.UI.Xaml.Controls.ItemsRepeaterScrollHost, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x57B9C /* #296 'Microsoft_UI_Xaml_Controls_ItemsStackPanel' => 'Microsoft.UI.Xaml.Controls.ItemsStackPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x57E9C /* #297 'Microsoft_UI_Xaml_Controls_ItemsView' => 'Microsoft.UI.Xaml.Controls.ItemsView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5879C /* #298 'Microsoft_UI_Xaml_Controls_ItemsWrapGrid' => 'Microsoft.UI.Xaml.Controls.ItemsWrapGrid, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5B39C /* #299 'Microsoft_UI_Xaml_Controls_MediaPlayerElement' => 'Microsoft.UI.Xaml.Controls.MediaPlayerElement, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5B99C /* #300 'Microsoft_UI_Xaml_Controls_MediaPlayerPresenter' => 'Microsoft.UI.Xaml.Controls.MediaPlayerPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5BB9C /* #301 'Microsoft_UI_Xaml_Controls_MediaTransportControls' => 'Microsoft.UI.Xaml.Controls.MediaTransportControls, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5D09C /* #302 'Microsoft_UI_Xaml_Controls_MenuBarItem' => 'Microsoft.UI.Xaml.Controls.MenuBarItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5DB9C /* #303 'Microsoft_UI_Xaml_Controls_MenuFlyoutItem' => 'Microsoft.UI.Xaml.Controls.MenuFlyoutItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5DF9C /* #304 'Microsoft_UI_Xaml_Controls_MenuFlyoutPresenter' => 'Microsoft.UI.Xaml.Controls.MenuFlyoutPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5E29C /* #305 'Microsoft_UI_Xaml_Controls_MenuFlyoutSubItem' => 'Microsoft.UI.Xaml.Controls.MenuFlyoutSubItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5E49C /* #306 'Microsoft_UI_Xaml_Controls_NavigationView' => 'Microsoft.UI.Xaml.Controls.NavigationView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x5F49C /* #307 'Microsoft_UI_Xaml_Controls_NavigationViewItem' => 'Microsoft.UI.Xaml.Controls.NavigationViewItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6099C /* #308 'Microsoft_UI_Xaml_Controls_NumberBox' => 'Microsoft.UI.Xaml.Controls.NumberBox, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6DB9C /* #309 'Microsoft_UI_Xaml_Controls_TextBox' => 'Microsoft.UI.Xaml.Controls.TextBox, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6129C /* #310 'Microsoft_UI_Xaml_Controls_PasswordBox' => 'Microsoft.UI.Xaml.Controls.PasswordBox, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6169C /* #311 'Microsoft_UI_Xaml_Controls_PathIcon' => 'Microsoft.UI.Xaml.Controls.PathIcon, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x61F9C /* #312 'Microsoft_UI_Xaml_Controls_PipsPager' => 'Microsoft.UI.Xaml.Controls.PipsPager, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6289C /* #313 'Microsoft_UI_Xaml_Controls_Pivot' => 'Microsoft.UI.Xaml.Controls.Pivot, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6329C /* #314 'Microsoft_UI_Xaml_Controls_ProgressRing' => 'Microsoft.UI.Xaml.Controls.ProgressRing, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6389C /* #315 'Microsoft_UI_Xaml_Controls_RadioButtons' => 'Microsoft.UI.Xaml.Controls.RadioButtons, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6F89C /* #316 'Microsoft_UI_Xaml_Controls_ToggleMenuFlyoutItem' => 'Microsoft.UI.Xaml.Controls.ToggleMenuFlyoutItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x63A9C /* #317 'Microsoft_UI_Xaml_Controls_RadioMenuFlyoutItem' => 'Microsoft.UI.Xaml.Controls.RadioMenuFlyoutItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x63D9C /* #318 'Microsoft_UI_Xaml_Controls_RatingControl' => 'Microsoft.UI.Xaml.Controls.RatingControl, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6439C /* #319 'Microsoft_UI_Xaml_Controls_RefreshContainer' => 'Microsoft.UI.Xaml.Controls.RefreshContainer, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6639C /* #320 'Microsoft_UI_Xaml_Controls_ScrollView' => 'Microsoft.UI.Xaml.Controls.ScrollView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6679C /* #321 'Microsoft_UI_Xaml_Controls_ScrollViewer' => 'Microsoft.UI.Xaml.Controls.ScrollViewer, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6869C /* #322 'Microsoft_UI_Xaml_Controls_SplitView' => 'Microsoft.UI.Xaml.Controls.SplitView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6959C /* #323 'Microsoft_UI_Xaml_Controls_SwipeControl' => 'Microsoft.UI.Xaml.Controls.SwipeControl, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6A69C /* #324 'Microsoft_UI_Xaml_Controls_SymbolIcon' => 'Microsoft.UI.Xaml.Controls.SymbolIcon, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6A99C /* #325 'Microsoft_UI_Xaml_Controls_TabView' => 'Microsoft.UI.Xaml.Controls.TabView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6C19C /* #326 'Microsoft_UI_Xaml_Controls_TeachingTip' => 'Microsoft.UI.Xaml.Controls.TeachingTip, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6EE9C /* #327 'Microsoft_UI_Xaml_Controls_TimePicker' => 'Microsoft.UI.Xaml.Controls.TimePicker, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x6FC9C /* #328 'Microsoft_UI_Xaml_Controls_ToggleSwitch' => 'Microsoft.UI.Xaml.Controls.ToggleSwitch, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7099C /* #329 'Microsoft_UI_Xaml_Controls_TreeViewItem' => 'Microsoft.UI.Xaml.Controls.TreeViewItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x70E9C /* #330 'Microsoft_UI_Xaml_Controls_TreeViewList' => 'Microsoft.UI.Xaml.Controls.TreeViewList, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7139C /* #331 'Microsoft_UI_Xaml_Controls_TwoPaneView' => 'Microsoft.UI.Xaml.Controls.TwoPaneView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x71B9C /* #332 'Microsoft_UI_Xaml_Controls_VariableSizedWrapGrid' => 'Microsoft.UI.Xaml.Controls.VariableSizedWrapGrid, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7259C /* #333 'Microsoft_UI_Xaml_Controls_WebView2' => 'Microsoft.UI.Xaml.Controls.WebView2, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7479C /* #334 'Microsoft_UI_Xaml_Controls_LayoutPanel' => 'Microsoft.UI.Xaml.Controls.LayoutPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x7619C /* #335 'Microsoft_UI_Xaml_Controls_PagerControl' => 'Microsoft.UI.Xaml.Controls.PagerControl, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8119C /* #336 'Microsoft_UI_Xaml_Controls_CalendarViewItem' => 'Microsoft.UI.Xaml.Controls.CalendarViewItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x82F9C /* #337 'Microsoft_UI_Xaml_Controls_DatePickerSelector' => 'Microsoft.UI.Xaml.Controls.DatePickerSelector, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8549C /* #338 'Microsoft_UI_Xaml_Controls_ItemsWrapGridLayout' => 'Microsoft.UI.Xaml.Controls.ItemsWrapGridLayout, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8639C /* #339 'Microsoft_UI_Xaml_Controls_ListViewBaseSource' => 'Microsoft.UI.Xaml.Controls.ListViewBaseSource, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8719C /* #340 'Microsoft_UI_Xaml_Controls_NativeListViewBase' => 'Microsoft.UI.Xaml.Controls.NativeListViewBase, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8D /* #341 'UIPickerView' => 'UIKit.UIPickerView, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8A09C /* #342 'Microsoft_UI_Xaml_Controls_Picker' => 'Microsoft.UI.Xaml.Controls.Picker, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8A99C /* #343 'Microsoft_UI_Xaml_Controls_NativePivotPresenter' => 'Microsoft.UI.Xaml.Controls.NativePivotPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8B39C /* #344 'Microsoft_UI_Xaml_Controls_NativeScrollContentPresenter' => 'Microsoft.UI.Xaml.Controls.NativeScrollContentPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xA7 /* #345 'UITextView' => 'UIKit.UITextView, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8C99C /* #346 'Microsoft_UI_Xaml_Controls_MultilineTextBoxView' => 'Microsoft.UI.Xaml.Controls.MultilineTextBoxView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xAD /* #347 'Microsoft_iOS__UIKit_UITextFieldDelegate' => 'UIKit.UITextFieldDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8D69C /* #348 'Microsoft_UI_Xaml_Controls_SinglelineTextBoxDelegate' => 'Microsoft.UI.Xaml.Controls.SinglelineTextBoxDelegate, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xB1 /* #349 'UITextField' => 'UIKit.UITextField, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8D99C /* #350 'Microsoft_UI_Xaml_Controls_SinglelineTextBoxView' => 'Microsoft.UI.Xaml.Controls.SinglelineTextBoxView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x8EC9C /* #351 'Microsoft_UI_Xaml_Controls_TimePickerSelector' => 'Microsoft.UI.Xaml.Controls.TimePickerSelector, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xB7 /* #352 'Microsoft_iOS__WebKit_WKNavigationDelegate' => 'WebKit.WKNavigationDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x8FE9C /* #353 'Microsoft_UI_Xaml_Controls_WebViewNavigationDelegate' => 'Microsoft.UI.Xaml.Controls.WebViewNavigationDelegate, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9009C /* #354 'Microsoft_UI_Xaml_Controls_WebView' => 'Microsoft.UI.Xaml.Controls.WebView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9259C /* #355 'Microsoft_UI_Xaml_Controls_Primitives_CalendarPanel' => 'Microsoft.UI.Xaml.Controls.Primitives.CalendarPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9329C /* #356 'Microsoft_UI_Xaml_Controls_Primitives_ColorSpectrum' => 'Microsoft.UI.Xaml.Controls.Primitives.ColorSpectrum, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9679C /* #357 'Microsoft_UI_Xaml_Controls_Primitives_LoopingSelector' => 'Microsoft.UI.Xaml.Controls.Primitives.LoopingSelector, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x96D9C /* #358 'Microsoft_UI_Xaml_Controls_Primitives_LoopingSelectorItem' => 'Microsoft.UI.Xaml.Controls.Primitives.LoopingSelectorItem, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9759C /* #359 'Microsoft_UI_Xaml_Controls_Primitives_NavigationViewItemPresenter' => 'Microsoft.UI.Xaml.Controls.Primitives.NavigationViewItemPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9869C /* #360 'Microsoft_UI_Xaml_Controls_Primitives_ScrollBar' => 'Microsoft.UI.Xaml.Controls.Primitives.ScrollBar, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x98F9C /* #361 'Microsoft_UI_Xaml_Controls_Primitives_ScrollPresenter' => 'Microsoft.UI.Xaml.Controls.Primitives.ScrollPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x9CA9C /* #362 'Microsoft_UI_Xaml_Controls_Primitives_PopupRoot' => 'Microsoft.UI.Xaml.Controls.Primitives.PopupRoot, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xF939C /* #363 'Uno_UI_WinRT_Extensions_UI_Popups_MessageDialogContentDialog' => 'Uno.UI.WinRT.Extensions.UI.Popups.MessageDialogContentDialog, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x101C9C /* #364 'Uno_UI_Xaml_Controls_SystemFocusVisual' => 'Uno.UI.Xaml.Controls.SystemFocusVisual, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xBF /* #365 'UIAlertView' => 'UIKit.UIAlertView, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10D59C /* #366 'Uno_UI_Views_Controls_BindableUIAlertView' => 'Uno.UI.Views.Controls.BindableUIAlertView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xC1 /* #367 'UIButton' => 'UIKit.UIButton, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10D79C /* #368 'Uno_UI_Views_Controls_BindableUIButton' => 'Uno.UI.Views.Controls.BindableUIButton, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xC3 /* #369 'UIProgressView' => 'UIKit.UIProgressView, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10D99C /* #370 'Uno_UI_Views_Controls_BindableUIProgressView' => 'Uno.UI.Views.Controls.BindableUIProgressView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x10DB9C /* #371 'Uno_UI_Views_Controls_BindableUIScrollView' => 'Uno.UI.Views.Controls.BindableUIScrollView, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xC5 /* #372 'UISwitch' => 'UIKit.UISwitch, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10DD9C /* #373 'Uno_UI_Views_Controls_BindableUISwitch' => 'Uno.UI.Views.Controls.BindableUISwitch, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x10E19C /* #374 'Uno_UI_Views_Controls_StrategyBasedDataTemplateSelectorControl' => 'Uno.UI.Views.Controls.StrategyBasedDataTemplateSelectorControl, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xC7 /* #375 'UISearchBar' => 'UIKit.UISearchBar, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10E79C /* #376 'Uno_UI_Controls_BindableSearchBar' => 'Uno.UI.Controls.BindableSearchBar, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xC9 /* #377 'UISlider' => 'UIKit.UISlider, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10E99C /* #378 'Uno_UI_Controls_BindableUISlider' => 'Uno.UI.Controls.BindableUISlider, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x10FE9C /* #379 'Uno_UI_Controls_NativeCommandBarPresenter' => 'Uno.UI.Controls.NativeCommandBarPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x11009C /* #380 'Uno_UI_Controls_FauxGradientBorderPresenter' => 'Uno.UI.Controls.FauxGradientBorderPresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x110A9C /* #381 'Uno_UI_Controls_NativeFramePresenter_PageViewController' => 'Uno.UI.Controls.NativeFramePresenter+PageViewController, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x110D9C /* #382 'Uno_UI_Controls_NativeFramePresenter_ControllerDelegate' => 'Uno.UI.Controls.NativeFramePresenter+ControllerDelegate, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x11079C /* #383 'Uno_UI_Controls_NativeFramePresenter' => 'Uno.UI.Controls.NativeFramePresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x11159C /* #384 'Uno_UI_Controls_RootViewController' => 'Uno.UI.Controls.RootViewController, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x11189C /* #385 'Uno_UI_Controls_StatePresenter' => 'Uno.UI.Controls.StatePresenter, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xCB /* #386 'UINavigationBar' => 'UIKit.UINavigationBar, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x111A9C /* #387 'Uno_UI_Controls_UnoNavigationBar' => 'Uno.UI.Controls.UnoNavigationBar, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x111E9C /* #388 'Uno_UI_Controls_ManagedItemsStackPanel' => 'Uno.UI.Controls.ManagedItemsStackPanel, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xCD /* #389 'UIWindow' => 'UIKit.UIWindow, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x11209C /* #390 'Uno_UI_Controls_Window' => 'Uno.UI.Controls.Window, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x11349C /* #391 'Uno_UI_Controls_Legacy_ListViewBaseLayout' => 'Uno.UI.Controls.Legacy.ListViewBaseLayout, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x11259C /* #392 'Uno_UI_Controls_Legacy_GridViewWrapGridLayout' => 'Uno.UI.Controls.Legacy.GridViewWrapGridLayout, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x113B9C /* #393 'LegacyInternalContainer' => 'Uno.UI.Controls.Legacy.ListViewBaseSource+InternalContainer, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x11409C /* #394 'Uno_UI_Controls_Legacy_ListViewLayout' => 'Uno.UI.Controls.Legacy.ListViewLayout, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x110B9C /* #395 'Uno_UI_Controls_NativeFramePresenter_FrameNavigationController' => 'Uno.UI.Controls.NativeFramePresenter+FrameNavigationController, Uno.UI' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x33A0 /* #396 'Uno_Media_Playback_VideoSurface' => 'Uno.Media.Playback.VideoSurface, Uno' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xCF /* #397 'Microsoft_iOS__UIKit_UIImagePickerControllerDelegate' => 'UIKit.UIImagePickerControllerDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x108A0 /* #398 'Windows_Media_Capture_CameraDelegate' => 'Windows.Media.Capture.CameraDelegate, Uno' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xD7 /* #399 'Microsoft_iOS__CallKit_CXCallObserverDelegate' => 'CallKit.CXCallObserverDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x162A0 /* #400 'Windows_ApplicationModel_Calls_CallObserverDelegate' => 'Windows.ApplicationModel.Calls.CallObserverDelegate, Uno' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x30A0 /* #401 'Uno_AuthenticationBroker_WebAuthenticationBrokerProvider_PresentationContextProviderToSharedKeyWindow' => 'Uno.AuthenticationBroker.WebAuthenticationBrokerProvider+PresentationContextProviderToSharedKeyWindow, Uno' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xEEA0 /* #402 'Windows_Storage_Pickers_FileOpenPicker_ImageOpenPickerDelegate' => 'Windows.Storage.Pickers.FileOpenPicker+ImageOpenPickerDelegate, Uno' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xDF /* #403 'Microsoft_iOS__UIKit_UIAdaptivePresentationControllerDelegate' => 'UIKit.UIAdaptivePresentationControllerDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xF5A0 /* #404 'Windows_Storage_Pickers_FileOpenPicker_FileOpenPickerPresentationControllerDelegate' => 'Windows.Storage.Pickers.FileOpenPicker+FileOpenPickerPresentationControllerDelegate, Uno' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xE3 /* #405 'Microsoft_iOS__UIKit_UIDocumentPickerDelegate' => 'UIKit.UIDocumentPickerDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xF7A0 /* #406 'Windows_Storage_Pickers_FolderPicker_FolderPickerDelegate' => 'Windows.Storage.Pickers.FolderPicker+FolderPickerDelegate, Uno' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xF8A0 /* #407 'Windows_Storage_Pickers_FolderPicker_FolderPickerPresentationControllerDelegate' => 'Windows.Storage.Pickers.FolderPicker+FolderPickerPresentationControllerDelegate, Uno' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xFFA0 /* #408 'Windows_Media_Playback_MediaPlayer_Observer' => 'Windows.Media.Playback.MediaPlayer+Observer, Uno' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xE7 /* #409 'UIImagePickerController' => 'UIKit.UIImagePickerController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x107A0 /* #410 'Windows_Media_Capture_CameraCaptureUI_LockedOrientationUIImagePickerController' => 'Windows.Media.Capture.CameraCaptureUI+LockedOrientationUIImagePickerController, Uno' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x12AA0 /* #411 'Windows_Devices_Geolocation_Geolocator_CLLocationManagerDelegate' => 'Windows.Devices.Geolocation.Geolocator+CLLocationManagerDelegate, Uno' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xED /* #412 'Microsoft_iOS__UIKit_UIActivityItemSource' => 'UIKit.UIActivityItemSource, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x14FA0 /* #413 'Windows_ApplicationModel_DataTransfer_DataTransferManager_DataActivityItemSource' => 'Windows.ApplicationModel.DataTransfer.DataTransferManager+DataActivityItemSource, Uno' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xF1 /* #414 'Microsoft_iOS__ContactsUI_CNContactPickerDelegate' => 'ContactsUI.CNContactPickerDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x160A0 /* #415 'Windows_ApplicationModel_Contacts_ContactPicker_SingleContactPickerDelegate' => 'Windows.ApplicationModel.Contacts.ContactPicker+SingleContactPickerDelegate, Uno' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x161A0 /* #416 'Windows_ApplicationModel_Contacts_ContactPicker_MultipleContactPickerDelegate' => 'Windows.ApplicationModel.Contacts.ContactPicker+MultipleContactPickerDelegate, Uno' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xF5 /* #417 'Microsoft_iOS__PhotosUI_PHPickerViewControllerDelegate' => 'PhotosUI.PHPickerViewControllerDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xEFA0 /* #418 'Windows_Storage_Pickers_FileOpenPicker_PhotoPickerDelegate' => 'Windows.Storage.Pickers.FileOpenPicker+PhotoPickerDelegate, Uno' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xF3A0 /* #419 'Windows_Storage_Pickers_FileOpenPicker_FileOpenPickerDelegate' => 'Windows.Storage.Pickers.FileOpenPicker+FileOpenPickerDelegate, Uno' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xFA2 /* #420 'Uno_UI_RemoteControl_RemoteControlStatusView' => 'Uno.UI.RemoteControl.RemoteControlStatusView, Uno.UI.RemoteControl' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0xF9 /* #421 'PHPickerResult' => 'PhotosUI.PHPickerResult, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xFB /* #422 'PHPickerViewController' => 'PhotosUI.PHPickerViewController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xFD /* #423 'CNContactPickerViewController' => 'ContactsUI.CNContactPickerViewController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0xFF /* #424 'EAGLContext' => 'OpenGLES.EAGLContext, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x101 /* #425 'MFMailComposeViewController' => 'MessageUI.MFMailComposeViewController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x103 /* #426 'Microsoft_iOS__MessageUI_MFMailComposeViewControllerDelegate' => 'MessageUI.MFMailComposeViewControllerDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x107 /* #427 'MessageUI_Mono_MFMailComposeViewControllerDelegate' => 'MessageUI.Mono_MFMailComposeViewControllerDelegate, Microsoft.iOS' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x10D /* #428 'WKPreferences' => 'WebKit.WKPreferences, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x10F /* #429 'WKWindowFeatures' => 'WebKit.WKWindowFeatures, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x111 /* #430 'WKBackForwardList' => 'WebKit.WKBackForwardList, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x113 /* #431 'WKBackForwardListItem' => 'WebKit.WKBackForwardListItem, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x115 /* #432 'WKContextMenuElementInfo' => 'WebKit.WKContextMenuElementInfo, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x117 /* #433 'WKDownload' => 'WebKit.WKDownload, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x11D /* #434 'WKFrameInfo' => 'WebKit.WKFrameInfo, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x11F /* #435 'WKNavigation' => 'WebKit.WKNavigation, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x121 /* #436 'WKNavigationAction' => 'WebKit.WKNavigationAction, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x123 /* #437 'WKNavigationResponse' => 'WebKit.WKNavigationResponse, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x129 /* #438 'WKPreviewElementInfo' => 'WebKit.WKPreviewElementInfo, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x12B /* #439 'WKScriptMessage' => 'WebKit.WKScriptMessage, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x12D /* #440 'WKSecurityOrigin' => 'WebKit.WKSecurityOrigin, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x12F /* #441 'WKUserContentController' => 'WebKit.WKUserContentController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x131 /* #442 'WKWebpagePreferences' => 'WebKit.WKWebpagePreferences, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x133 /* #443 'WKWebViewConfiguration' => 'WebKit.WKWebViewConfiguration, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x135 /* #444 'NSIndexPath' => 'Foundation.NSIndexPath, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x137 /* #445 'Foundation_NSDispatcher' => 'Foundation.NSDispatcher, Microsoft.iOS' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x13D /* #446 '__MonoMac_NSActionDispatcher' => 'Foundation.NSActionDispatcher, Microsoft.iOS' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x141 /* #447 '__MonoMac_NSSynchronizationContextDispatcher' => 'Foundation.NSSynchronizationContextDispatcher, Microsoft.iOS' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x145 /* #448 'Foundation_NSAsyncDispatcher' => 'Foundation.NSAsyncDispatcher, Microsoft.iOS' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x14B /* #449 '__MonoMac_NSAsyncActionDispatcher' => 'Foundation.NSAsyncActionDispatcher, Microsoft.iOS' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x14F /* #450 '__MonoMac_NSAsyncSynchronizationContextDispatcher' => 'Foundation.NSAsyncSynchronizationContextDispatcher, Microsoft.iOS' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x157 /* #451 'NSArray' => 'Foundation.NSArray, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x15D /* #452 'NSAttributedString' => 'Foundation.NSAttributedString, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x15F /* #453 'NSBundle' => 'Foundation.NSBundle, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x161 /* #454 'NSCalendar' => 'Foundation.NSCalendar, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x163 /* #455 'NSCoder' => 'Foundation.NSCoder, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x165 /* #456 'NSDate' => 'Foundation.NSDate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x167 /* #457 'NSDateComponents' => 'Foundation.NSDateComponents, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x169 /* #458 'NSError' => 'Foundation.NSError, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x16B /* #459 'Foundation_NSExceptionError' => 'Foundation.NSExceptionError, Microsoft.iOS' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x16D /* #460 'NSFileManager' => 'Foundation.NSFileManager, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x16F /* #461 'NSHTTPCookie' => 'Foundation.NSHttpCookie, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x171 /* #462 'NSStream' => 'Foundation.NSStream, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x173 /* #463 'NSInputStream' => 'Foundation.NSInputStream, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x175 /* #464 'NSLocale' => 'Foundation.NSLocale, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x177 /* #465 'NSMutableAttributedString' => 'Foundation.NSMutableAttributedString, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x179 /* #466 'NSSet' => 'Foundation.NSSet, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x17B /* #467 'NSMutableSet' => 'Foundation.NSMutableSet, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x17D /* #468 'NSURLRequest' => 'Foundation.NSUrlRequest, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x17F /* #469 'NSMutableURLRequest' => 'Foundation.NSMutableUrlRequest, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x181 /* #470 'Foundation_InternalNSNotificationHandler' => 'Foundation.InternalNSNotificationHandler, Microsoft.iOS' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x185 /* #471 'NSNull' => 'Foundation.NSNull, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x187 /* #472 'NSValue' => 'Foundation.NSValue, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x189 /* #473 'NSNumber' => 'Foundation.NSNumber, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x18B /* #474 'NSProgress' => 'Foundation.NSProgress, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x18D /* #475 'NSProxy' => 'Foundation.NSProxy, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x18F /* #476 'NSRunLoop' => 'Foundation.NSRunLoop, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x191 /* #477 'NSString' => 'Foundation.NSString, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x193 /* #478 'NSThread' => 'Foundation.NSThread, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x195 /* #479 'NSTimeZone' => 'Foundation.NSTimeZone, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x197 /* #480 'NSTimer' => 'Foundation.NSTimer, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x199 /* #481 'NSUndoManager' => 'Foundation.NSUndoManager, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x19B /* #482 'NSURL' => 'Foundation.NSUrl, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x19D /* #483 'NSURLCredential' => 'Foundation.NSUrlCredential, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x19F /* #484 'NSURLProtectionSpace' => 'Foundation.NSUrlProtectionSpace, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1A1 /* #485 'NSUserDefaults' => 'Foundation.NSUserDefaults, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1A3 /* #486 'NSAutoreleasePool' => 'Foundation.NSAutoreleasePool, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1A5 /* #487 'NSCachedURLResponse' => 'Foundation.NSCachedUrlResponse, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1A7 /* #488 'NSEnumerator' => 'Foundation.NSEnumerator, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1A9 /* #489 'NSException' => 'Foundation.NSException, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1AB /* #490 'NSHTTPCookieStorage' => 'Foundation.NSHttpCookieStorage, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1AD /* #491 'NSURLResponse' => 'Foundation.NSUrlResponse, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1AF /* #492 'NSHTTPURLResponse' => 'Foundation.NSHttpUrlResponse, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1B1 /* #493 'NSIndexSet' => 'Foundation.NSIndexSet, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1B3 /* #494 'NSJSONSerialization' => 'Foundation.NSJsonSerialization, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1B5 /* #495 'NSNotification' => 'Foundation.NSNotification, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1B7 /* #496 'NSOperationQueue' => 'Foundation.NSOperationQueue, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1B9 /* #497 'NSProcessInfo' => 'Foundation.NSProcessInfo, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1BB /* #498 'NSStringDrawingContext' => 'Foundation.NSStringDrawingContext, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1BD /* #499 'NSURLAuthenticationChallenge' => 'Foundation.NSUrlAuthenticationChallenge, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1C3 /* #500 'Microsoft_iOS__Foundation_NSUrlSessionDelegate' => 'Foundation.NSUrlSessionDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1C5 /* #501 'Microsoft_iOS__Foundation_NSUrlSessionTaskDelegate' => 'Foundation.NSUrlSessionTaskDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1C7 /* #502 'Microsoft_iOS__Foundation_NSUrlSessionDataDelegate' => 'Foundation.NSUrlSessionDataDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1CB /* #503 'NSURLSessionTask' => 'Foundation.NSUrlSessionTask, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1CD /* #504 'NSURLSessionDataTask' => 'Foundation.NSUrlSessionDataTask, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1CF /* #505 'NSUserActivity' => 'Foundation.NSUserActivity, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1D1 /* #506 'CLLocationManager' => 'CoreLocation.CLLocationManager, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1D3 /* #507 'CLBeacon' => 'CoreLocation.CLBeacon, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1D5 /* #508 'CLBeaconIdentityConstraint' => 'CoreLocation.CLBeaconIdentityConstraint, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1D7 /* #509 'CLRegion' => 'CoreLocation.CLRegion, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1D9 /* #510 'CLBeaconRegion' => 'CoreLocation.CLBeaconRegion, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1DB /* #511 'CLHeading' => 'CoreLocation.CLHeading, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1DD /* #512 'CLLocation' => 'CoreLocation.CLLocation, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1DF /* #513 'CLVisit' => 'CoreLocation.CLVisit, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1E1 /* #514 'CAAnimation' => 'CoreAnimation.CAAnimation, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1E3 /* #515 'CAPropertyAnimation' => 'CoreAnimation.CAPropertyAnimation, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1E5 /* #516 'CABasicAnimation' => 'CoreAnimation.CABasicAnimation, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1E7 /* #517 'CAGradientLayer' => 'CoreAnimation.CAGradientLayer, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1E9 /* #518 'CAKeyframeAnimation' => 'CoreAnimation.CAKeyFrameAnimation, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1EB /* #519 'CADisplayLink' => 'CoreAnimation.CADisplayLink, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1ED /* #520 'Microsoft_iOS__CoreAnimation_CALayerDelegate' => 'CoreAnimation.CALayerDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1EF /* #521 'CAMediaTimingFunction' => 'CoreAnimation.CAMediaTimingFunction, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1F5 /* #522 'CAShapeLayer' => 'CoreAnimation.CAShapeLayer, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1F7 /* #523 'CATransaction' => 'CoreAnimation.CATransaction, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1F9 /* #524 'CNContact' => 'Contacts.CNContact, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1FB /* #525 'CXCall' => 'CallKit.CXCall, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1FD /* #526 'CXCallObserver' => 'CallKit.CXCallObserver, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x1FF /* #527 'ASWebAuthenticationSession' => 'AuthenticationServices.ASWebAuthenticationSession, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x201 /* #528 'NSLayoutManager' => 'UIKit.NSLayoutManager, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x203 /* #529 'NSLayoutConstraint' => 'UIKit.NSLayoutConstraint, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x205 /* #530 'UIAccessibilityCustomAction' => 'UIKit.UIAccessibilityCustomAction, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x207 /* #531 'Microsoft_iOS__UIKit_UIAppearance' => 'UIKit.UIAppearance, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x209 /* #532 'UIBarItem' => 'UIKit.UIBarItem, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x20B /* #533 'UIBezierPath' => 'UIKit.UIBezierPath, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x20D /* #534 'UICollectionViewLayoutAttributes' => 'UIKit.UICollectionViewLayoutAttributes, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x20F /* #535 'UIColor' => 'UIKit.UIColor, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x211 /* #536 'UIKit_UIControlEventProxy' => 'UIKit.UIControlEventProxy, Microsoft.iOS' */, (MTTypeFlags) (2) /* UserType */ },
		{ NULL, 0x215 /* #537 'UIDevice' => 'UIKit.UIDevice, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x217 /* #538 'UIEvent' => 'UIKit.UIEvent, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x219 /* #539 'UIFont' => 'UIKit.UIFont, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x21B /* #540 'UIFontDescriptor' => 'UIKit.UIFontDescriptor, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x21D /* #541 'UIGestureRecognizer' => 'UIKit.UIGestureRecognizer, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x21F /* #542 'UIPanGestureRecognizer' => 'UIKit.UIPanGestureRecognizer, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x221 /* #543 'UIPinchGestureRecognizer' => 'UIKit.UIPinchGestureRecognizer, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x223 /* #544 'UIImage' => 'UIKit.UIImage, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x225 /* #545 'UIMenuElement' => 'UIKit.UIMenuElement, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x227 /* #546 'UIMenu' => 'UIKit.UIMenu, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x229 /* #547 'UIPasteboard' => 'UIKit.UIPasteboard, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x22B /* #548 'UIPresentationController' => 'UIKit.UIPresentationController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x22D /* #549 'UIPopoverPresentationController' => 'UIKit.UIPopoverPresentationController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x22F /* #550 'UIScreen' => 'UIKit.UIScreen, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x231 /* #551 'UIToolbar' => 'UIKit.UIToolbar, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x233 /* #552 'UIScene' => 'UIKit.UIScene, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x235 /* #553 'UIWindowScene' => 'UIKit.UIWindowScene, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x237 /* #554 'UITraitCollection' => 'UIKit.UITraitCollection, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x23D /* #555 'NSAdaptiveImageGlyph' => 'UIKit.NSAdaptiveImageGlyph, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x23F /* #556 'NSLayoutAnchor' => 'UIKit.NSLayoutAnchor`1, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x241 /* #557 'NSLayoutDimension' => 'UIKit.NSLayoutDimension, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x243 /* #558 'NSLayoutXAxisAnchor' => 'UIKit.NSLayoutXAxisAnchor, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x245 /* #559 'NSLayoutYAxisAnchor' => 'UIKit.NSLayoutYAxisAnchor, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x247 /* #560 'NSParagraphStyle' => 'UIKit.NSParagraphStyle, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x249 /* #561 'NSMutableParagraphStyle' => 'UIKit.NSMutableParagraphStyle, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x24B /* #562 'NSTextAttachment' => 'UIKit.NSTextAttachment, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x24D /* #563 'NSTextContainer' => 'UIKit.NSTextContainer, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x24F /* #564 'NSTextLayoutManager' => 'UIKit.NSTextLayoutManager, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x251 /* #565 'NSTextStorage' => 'UIKit.NSTextStorage, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x253 /* #566 'UIAccessibilityLocationDescriptor' => 'UIKit.UIAccessibilityLocationDescriptor, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x255 /* #567 'UIAction' => 'UIKit.UIAction, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x25B /* #568 'UIActivity' => 'UIKit.UIActivity, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x261 /* #569 'UIActivityViewController' => 'UIKit.UIActivityViewController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x263 /* #570 'UIAlertAction' => 'UIKit.UIAlertAction, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x265 /* #571 'UIAlertController' => 'UIKit.UIAlertController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x26B /* #572 'Microsoft_iOS__UIKit_UIAlertViewDelegate' => 'UIKit.UIAlertViewDelegate, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x26D /* #573 'UIApplicationShortcutItem' => 'UIKit.UIApplicationShortcutItem, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x26F /* #574 'UIBarAppearance' => 'UIKit.UIBarAppearance, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x271 /* #575 'UIBarButtonItemAppearance' => 'UIKit.UIBarButtonItemAppearance, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x273 /* #576 'UIBarButtonItemStateAppearance' => 'UIKit.UIBarButtonItemStateAppearance, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x275 /* #577 'UIVisualEffect' => 'UIKit.UIVisualEffect, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x277 /* #578 'UIBlurEffect' => 'UIKit.UIBlurEffect, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x279 /* #579 'UIButtonConfiguration' => 'UIKit.UIButtonConfiguration, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x28F /* #580 'UICollectionViewPlaceholder' => 'UIKit.UICollectionViewPlaceholder, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x291 /* #581 'UICollectionViewDropPlaceholder' => 'UIKit.UICollectionViewDropPlaceholder, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x29B /* #582 'UIDropProposal' => 'UIKit.UIDropProposal, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x29D /* #583 'UICollectionViewDropProposal' => 'UIKit.UICollectionViewDropProposal, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x29F /* #584 'UICollectionViewFlowLayout' => 'UIKit.UICollectionViewFlowLayout, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2A1 /* #585 'UIFocusUpdateContext' => 'UIKit.UIFocusUpdateContext, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2A3 /* #586 'UICollectionViewFocusUpdateContext' => 'UIKit.UICollectionViewFocusUpdateContext, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2A5 /* #587 'UICollectionViewTransitionLayout' => 'UIKit.UICollectionViewTransitionLayout, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2A7 /* #588 'UICollectionViewUpdateItem' => 'UIKit.UICollectionViewUpdateItem, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2A9 /* #589 'UICommand' => 'UIKit.UICommand, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2AB /* #590 'UIContextMenuConfiguration' => 'UIKit.UIContextMenuConfiguration, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2B1 /* #591 'UIContextMenuInteraction' => 'UIKit.UIContextMenuInteraction, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2BF /* #592 'UICubicTimingParameters' => 'UIKit.UICubicTimingParameters, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2C1 /* #593 'UIDocument' => 'UIKit.UIDocument, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2C3 /* #594 'UIDocumentPickerViewController' => 'UIKit.UIDocumentPickerViewController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2C5 /* #595 'UIDragInteraction' => 'UIKit.UIDragInteraction, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2C7 /* #596 'UIDragItem' => 'UIKit.UIDragItem, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2C9 /* #597 'UIPreviewParameters' => 'UIKit.UIPreviewParameters, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2CB /* #598 'UIDragPreviewParameters' => 'UIKit.UIDragPreviewParameters, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2CD /* #599 'UIPreviewTarget' => 'UIKit.UIPreviewTarget, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2CF /* #600 'UIDragPreviewTarget' => 'UIKit.UIDragPreviewTarget, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2D5 /* #601 'UIDropInteraction' => 'UIKit.UIDropInteraction, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2DF /* #602 'UIFeedbackGenerator' => 'UIKit.UIFeedbackGenerator, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2E1 /* #603 'UIFindInteraction' => 'UIKit.UIFindInteraction, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2E3 /* #604 'UIFocusAnimationCoordinator' => 'UIKit.UIFocusAnimationCoordinator, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2E5 /* #605 'UIFocusEffect' => 'UIKit.UIFocusEffect, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2E7 /* #606 'UIFocusMovementHint' => 'UIKit.UIFocusMovementHint, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2E9 /* #607 'UIHoverStyle' => 'UIKit.UIHoverStyle, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2EB /* #608 'UIImageConfiguration' => 'UIKit.UIImageConfiguration, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2ED /* #609 'UIImageSymbolConfiguration' => 'UIKit.UIImageSymbolConfiguration, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2EF /* #610 'UIImpactFeedbackGenerator' => 'UIKit.UIImpactFeedbackGenerator, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2F5 /* #611 'UIInputViewController' => 'UIKit.UIInputViewController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2F7 /* #612 'UIKey' => 'UIKit.UIKey, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2F9 /* #613 'UILayoutGuide' => 'UIKit.UILayoutGuide, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2FB /* #614 'UITrackingLayoutGuide' => 'UIKit.UITrackingLayoutGuide, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2FD /* #615 'UIKeyboardLayoutGuide' => 'UIKit.UIKeyboardLayoutGuide, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x2FF /* #616 'UIKeyCommand' => 'UIKit.UIKeyCommand, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x301 /* #617 'UILabel' => 'UIKit.UILabel, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x303 /* #618 'UIMotionEffect' => 'UIKit.UIMotionEffect, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x305 /* #619 'UINavigationBarAppearance' => 'UIKit.UINavigationBarAppearance, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x30B /* #620 'UINavigationItem' => 'UIKit.UINavigationItem, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x30D /* #621 'UIPasteConfiguration' => 'UIKit.UIPasteConfiguration, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x30F /* #622 'UIPointerEffect' => 'UIKit.UIPointerEffect, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x311 /* #623 'UIPointerShape' => 'UIKit.UIPointerShape, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x313 /* #624 'UIPointerStyle' => 'UIKit.UIPointerStyle, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x319 /* #625 'UIPress' => 'UIKit.UIPress, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x31B /* #626 'UIPressesEvent' => 'UIKit.UIPressesEvent, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x31D /* #627 'UIPrintFormatter' => 'UIKit.UIPrintFormatter, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x323 /* #628 'UISearchTextField' => 'UIKit.UISearchTextField, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x329 /* #629 'UISpringTimingParameters' => 'UIKit.UISpringTimingParameters, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x32B /* #630 'UIStatusBarManager' => 'UIKit.UIStatusBarManager, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x32D /* #631 'UIStoryboard' => 'UIKit.UIStoryboard, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x333 /* #632 'UITabBarItem' => 'UIKit.UITabBarItem, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x335 /* #633 'UITargetedPreview' => 'UIKit.UITargetedPreview, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x337 /* #634 'UITargetedDragPreview' => 'UIKit.UITargetedDragPreview, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x345 /* #635 'UITextDropProposal' => 'UIKit.UITextDropProposal, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x34B /* #636 'UITextFormattingViewController' => 'UIKit.UITextFormattingViewController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x34D /* #637 'UITextFormattingViewControllerConfiguration' => 'UIKit.UITextFormattingViewControllerConfiguration, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x34F /* #638 'UITextInputAssistantItem' => 'UIKit.UITextInputAssistantItem, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x351 /* #639 'UITextInputMode' => 'UIKit.UITextInputMode, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x353 /* #640 'UITextInputPasswordRules' => 'UIKit.UITextInputPasswordRules, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x359 /* #641 'UITextItem' => 'UIKit.UITextItem, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x35B /* #642 'UITextItemMenuConfiguration' => 'UIKit.UITextItemMenuConfiguration, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x365 /* #643 'UITextPlaceholder' => 'UIKit.UITextPlaceholder, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x367 /* #644 'UITextPosition' => 'UIKit.UITextPosition, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x369 /* #645 'UITextRange' => 'UIKit.UITextRange, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x36B /* #646 'UITextSelectionRect' => 'UIKit.UITextSelectionRect, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x36D /* #647 'UIToolTipInteraction' => 'UIKit.UIToolTipInteraction, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x36F /* #648 'UITouch' => 'UIKit.UITouch, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x38D /* #649 'UIViewPrintFormatter' => 'UIKit.UIViewPrintFormatter, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x38F /* #650 'UIVisualEffectView' => 'UIKit.UIVisualEffectView, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x391 /* #651 'UIWebView' => 'UIKit.UIWebView, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x393 /* #652 'UIWindowSceneActivationConfiguration' => 'UIKit.UIWindowSceneActivationConfiguration, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x395 /* #653 'AVPlayerLayer' => 'AVFoundation.AVPlayerLayer, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x397 /* #654 'AVPlayer' => 'AVFoundation.AVPlayer, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x399 /* #655 'AVAudioSession' => 'AVFoundation.AVAudioSession, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x39B /* #656 'AVAsset' => 'AVFoundation.AVAsset, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x39D /* #657 'AVPlayerItemTrack' => 'AVFoundation.AVPlayerItemTrack, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x39F /* #658 'AVQueuePlayer' => 'AVFoundation.AVQueuePlayer, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3A1 /* #659 'GLKit_GLKView__GLKViewDelegate' => 'GLKit.GLKView+_GLKViewDelegate, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3A5 /* #660 'NSData' => 'Foundation.NSData, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3A7 /* #661 'NSDictionary' => 'Foundation.NSDictionary, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3A9 /* #662 'NSItemProvider' => 'Foundation.NSItemProvider, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3AB /* #663 'NSMutableData' => 'Foundation.NSMutableData, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3AD /* #664 'NSMutableDictionary' => 'Foundation.NSMutableDictionary, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3AF /* #665 'NSNotificationCenter' => 'Foundation.NSNotificationCenter, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3B1 /* #666 '__NSObject_Disposer' => 'Foundation.NSObject+NSObject_Disposer, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3B7 /* #667 'NSURLSessionConfiguration' => 'Foundation.NSUrlSessionConfiguration, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3B9 /* #668 'NSURLSession' => 'Foundation.NSUrlSession, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3BB /* #669 'CoreAnimation_CAAnimation__CAAnimationDelegate' => 'CoreAnimation.CAAnimation+_CAAnimationDelegate, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3C3 /* #670 'System_Net_Http_NSUrlSessionHandler_WrappedNSInputStream' => 'System.Net.Http.NSUrlSessionHandler+WrappedNSInputStream, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3DD /* #671 'UIKit_UIActionSheet__UIActionSheetDelegate' => 'UIKit.UIActionSheet+_UIActionSheetDelegate, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3EB /* #672 'UIActionSheet' => 'UIKit.UIActionSheet, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3ED /* #673 'UIKit_UIAlertView__UIAlertViewDelegate' => 'UIKit.UIAlertView+_UIAlertViewDelegate, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x3FD /* #674 'UIApplication' => 'UIKit.UIApplication, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x3FF /* #675 'UIKit_UIBarButtonItem_Callback' => 'UIKit.UIBarButtonItem+Callback, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x405 /* #676 'UIBarButtonItem' => 'UIKit.UIBarButtonItem, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x407 /* #677 'UIKit_UIView_UIViewAppearance' => 'UIKit.UIView+UIViewAppearance, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x40B /* #678 'UIKit_UIControl_UIControlAppearance' => 'UIKit.UIControl+UIControlAppearance, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x40D /* #679 '__UIGestureRecognizerToken' => 'UIKit.UIGestureRecognizer+Token, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x40F /* #680 'UIKit_UIPopoverController__UIPopoverControllerDelegate' => 'UIKit.UIPopoverController+_UIPopoverControllerDelegate, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x419 /* #681 'UIPopoverController' => 'UIKit.UIPopoverController, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x41B /* #682 'UIKit_UISearchBar__UISearchBarDelegate' => 'UIKit.UISearchBar+_UISearchBarDelegate, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x435 /* #683 'UIKit_UITextField__UITextFieldDelegate' => 'UIKit.UITextField+_UITextFieldDelegate, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x449 /* #684 'UIKit_UIScrollView__UIScrollViewDelegate' => 'UIKit.UIScrollView+_UIScrollViewDelegate, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x469 /* #685 'UIKit_UITextView__UITextViewDelegate' => 'UIKit.UITextView+_UITextViewDelegate, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x493 /* #686 'UIKit_UIDatePicker_UIDatePickerAppearance' => 'UIKit.UIDatePicker+UIDatePickerAppearance, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x495 /* #687 'UIDatePicker' => 'UIKit.UIDatePicker, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x497 /* #688 'UIKit_UITabBar__UITabBarDelegate' => 'UIKit.UITabBar+_UITabBarDelegate, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0x4A5 /* #689 'UITabBar' => 'UIKit.UITabBar, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x4A7 /* #690 'AVPlayerItem' => 'AVFoundation.AVPlayerItem, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x4A9 /* #691 'AVAssetTrack' => 'AVFoundation.AVAssetTrack, Microsoft.iOS' */, (MTTypeFlags) (0) /* None */ },
		{ NULL, 0x4AB /* #692 'System_Net_Http_NSUrlSessionHandler_NSUrlSessionHandlerDelegate' => 'System.Net.Http.NSUrlSessionHandler+NSUrlSessionHandlerDelegate, Microsoft.iOS' */, (MTTypeFlags) (3) /* CustomType, UserType */ },
		{ NULL, 0 },
	};

	static const MTManagedClassMap __xamarin_skipped_map [] = {
		{ 0x4C1, 0x17B /* 'Foundation.NSMutableSet`1' => 'Foundation.NSMutableSet' */ },
		{ 0x4C3, 0x179 /* 'Foundation.NSSet`1' => 'Foundation.NSSet' */ },
		{ 0x4C5, 0x3A7 /* 'Foundation.NSDictionary`2' => 'Foundation.NSDictionary' */ },
	};

	static const MTAssembly __xamarin_registration_assemblies [] = {
		{ "aot-instances", "42b48a5c-01c3-4445-a2a8-9e9de4943073" }, 
		{ "Unoapp1", "3c5e15ad-8dbe-44d9-883f-3ade51d2c919" }, 
		{ "CommonServiceLocator", "aff27152-ca08-4d81-97e0-2491f2173bb4" }, 
		{ "CommunityToolkit.Mvvm", "119d4b87-2c08-4ddf-8572-eb7a94321179" }, 
		{ "Microsoft.Extensions.Configuration", "5b11d0c3-8a48-44c6-9a7f-c2dacf2feca4" }, 
		{ "Microsoft.Extensions.Configuration.Abstractions", "1d055128-3c6d-48cf-ad45-b4a7ba58b446" }, 
		{ "Microsoft.Extensions.Configuration.Binder", "dfb88778-864f-4e6f-99d6-b6fddcf5b234" }, 
		{ "Microsoft.Extensions.Configuration.CommandLine", "297a9a8b-e57a-46d6-91a9-1ef3fa88e627" }, 
		{ "Microsoft.Extensions.Configuration.EnvironmentVariables", "181c492d-a49e-4690-a03c-2fea71888f43" }, 
		{ "Microsoft.Extensions.Configuration.FileExtensions", "4482a2c1-7d97-4a7d-9b94-244105149779" }, 
		{ "Microsoft.Extensions.Configuration.Json", "c44f65ad-f054-475b-a55b-05f079b4a328" }, 
		{ "Microsoft.Extensions.DependencyInjection", "2a6f9af7-d546-4ca0-8a6e-658c999a66a5" }, 
		{ "Microsoft.Extensions.DependencyInjection.Abstractions", "252913f7-311b-45c2-ab59-f103c0a69057" }, 
		{ "Microsoft.Extensions.FileProviders.Abstractions", "c3878873-c476-48f4-8f49-2e0c581a325d" }, 
		{ "Microsoft.Extensions.FileProviders.Physical", "d1210f58-fa8f-439a-8d1b-eaf433f03fab" }, 
		{ "Microsoft.Extensions.FileSystemGlobbing", "fc0ac943-7b5d-40e8-b159-783ae84dece0" }, 
		{ "Microsoft.Extensions.Hosting", "9bc277eb-c1d3-4b19-9951-80e9573943c3" }, 
		{ "Microsoft.Extensions.Hosting.Abstractions", "a184fef0-5165-4b68-8869-600f5c5288e8" }, 
		{ "Microsoft.Extensions.Logging", "2c5eb859-193d-43a3-9958-ae36be4e4eb6" }, 
		{ "Microsoft.Extensions.Logging.Abstractions", "ebbbba3c-9e99-435a-95fe-4a6bb977c7dd" }, 
		{ "Microsoft.Extensions.Logging.Configuration", "b3627e3a-c231-47c5-b2e2-c266f9f9714a" }, 
		{ "Microsoft.Extensions.Options", "efb9738a-1bf6-4baf-ae16-f4bddb9a0ed8" }, 
		{ "Microsoft.Extensions.Options.ConfigurationExtensions", "6fa770fc-1242-492f-9953-f8c8c6aead8d" }, 
		{ "Microsoft.Extensions.Primitives", "d33486b0-f055-4e3e-9f65-a41b906eea52" }, 
		{ "Microsoft.IO.RecyclableMemoryStream", "8af021de-09e8-4987-9d73-fc756a4b00a6" }, 
		{ "Newtonsoft.Json", "915b4a23-253f-4570-818a-19dc2cad19c9" }, 
		{ "SkiaSharp", "8b606933-1a18-48ca-87b1-eb599ccf5855" }, 
		{ "SkiaSharp.SceneGraph", "45780e78-8751-4fac-b125-74dc44c7e175" }, 
		{ "SkiaSharp.Skottie", "a3940110-4c6b-4e5c-b4fd-98e6bb89c761" }, 
		{ "SkiaSharp.Views.Windows", "6071180a-959e-43f1-9c2b-07f61dde7f7b" }, 
		{ "Splat", "8ebb4ba5-2746-487c-b788-15cc1b704d4c" }, 
		{ "Splat.Drawing", "0de10870-da30-422d-a61a-3349951b4d27" }, 
		{ "Splat.TransportLogger", "7759b269-e161-49af-99b2-2b05c8fce4b4" }, 
		{ "System.Json", "9ff41f4b-5469-434f-abd0-490b64c4a736" }, 
		{ "Uno.Core.Extensions.Collections", "d12232af-fe76-4af9-8689-255b007c8844" }, 
		{ "Uno.Core.Extensions.Disposables", "8b427a6b-1c32-468b-b067-56679c580095" }, 
		{ "Uno.Core.Extensions.Equality", "88daf255-03be-4bf9-82af-53d7e28ec8f0" }, 
		{ "Uno.Core.Extensions.Logging", "be65ab87-36c2-4b5d-aa04-9fbfc20b4edf" }, 
		{ "Uno.Core.Extensions.Logging.Singleton", "3557d595-c8c1-499d-83ce-d2737dc3e4c5" }, 
		{ "Uno.Diagnostics.Eventing", "f6d37d01-fa7f-422a-8e15-c9dc0f54816e" }, 
		{ "Uno.Extensions.Configuration", "8275fb24-9bc3-4d4b-83a4-5d18a863ac2e" }, 
		{ "Uno.Extensions.Core", "b9a55da3-bda1-4e4a-84a7-8eb3fa20f187" }, 
		{ "Uno.Extensions.Core.UI", "ccaa76a8-b1bb-44e6-b699-b7a15ccb67e6" }, 
		{ "Uno.Extensions.Hosting", "77087352-9826-4cac-9e2d-771c2773dd2f" }, 
		{ "Uno.Extensions.Hosting.WinUI", "153339df-5c8e-437a-8796-4e73ed36ea28" }, 
		{ "Uno.Extensions.Logging.OSLog", "cf053ee2-f00c-4dd5-902b-83036485913e" }, 
		{ "Uno.Extensions.Serialization", "3fb1deee-328f-42a5-9656-1e4ef6a1749c" }, 
		{ "Uno.Extensions.Storage", "042251d6-2000-416e-8bd7-0644924a90c4" }, 
		{ "Uno.Extensions.Storage.UI", "26e2b365-ebdb-4fb9-8d5a-c8f7f8cbb84d" }, 
		{ "uno.fonts.fluent", "9d088f2a-4087-49db-9a03-26977a03ee50" }, 
		{ "Uno.Fonts.OpenSans", "dad38f8d-3430-4119-95bb-b206ad217957" }, 
		{ "Uno.Fonts.Roboto", "74752a96-4a74-41b2-a94a-9bb64831f74f" }, 
		{ "Uno.Foundation.Logging", "14257100-04e7-4c09-a927-43b2256304dd" }, 
		{ "Uno.Material.WinUI", "a31c14af-2d0b-46e1-9757-3859cb3a1401" }, 
		{ "Uno.Themes.WinUI", "4cbb1c57-7f17-421a-8306-c808e8bc3fa1" }, 
		{ "Uno.Toolkit", "1b919e81-8cca-46ad-8692-ae6654eda449" }, 
		{ "Uno.Toolkit.WinUI", "71c3f6cb-470e-4f62-9dd7-283b455d0013" }, 
		{ "Uno.Toolkit.WinUI.Material", "a2cad4f4-559f-4737-bcce-878dc89a35bd" }, 
		{ "Uno.UI.Adapter.Microsoft.Extensions.Logging", "327a6e6b-7ace-4e11-8e0f-e77d47dbd222" }, 
		{ "Uno.UI.HotDesign.Abstractions", "92d2be19-aa0c-41f1-9cdc-7261715af277" }, 
		{ "Uno.UI.HotDesign.Client.Core", "ab28adc6-1b85-496d-b710-41faf81f6518" }, 
		{ "Uno.UI.HotDesign.Client", "df40bdf6-e17c-4101-98d7-1f3176c6c30e" }, 
		{ "Uno.UI.HotDesign.CommunityToolkit", "a5eb6110-ef16-4b42-8bc0-185e508a41f8" }, 
		{ "Uno.UI.HotDesign.Hierarchy", "92241360-03a0-4c0f-b5a2-2ab8ebb020c0" }, 
		{ "Uno.UI.HotDesign.Messaging", "837c6e64-8be8-4042-9c83-bd0b1a0b10b8" }, 
		{ "Uno.UI.HotDesign.PropertyGrid", "74b59d95-37e2-401b-b2e5-85f3e3988c48" }, 
		{ "Uno.UI.HotDesign.Toolbox", "81192637-9945-4368-8dbb-0d1b6615c931" }, 
		{ "Uno.UI.HotDesign.Xaml.Interactions", "28c36d6f-ecd7-4aaf-89bc-f29e4e196186" }, 
		{ "Uno.UI.HotDesign.Xaml.Interactivity", "7904e776-99d1-47b5-8b92-123b7fbda9b6" }, 
		{ "Uno.UI.HotDesign.Xaml", "fc05c60d-5c08-43f9-a97a-dc0c27b96d92" }, 
		{ "Uno.UI.HotDesign", "0c680e5f-055d-4585-b731-aff295a2e517" }, 
		{ "Uno.Foundation", "ad7213b3-c198-4dfc-a8e3-1558c6239b75" }, 
		{ "Uno.UI.Composition", "d2ca3c68-fea0-40ef-a4fc-7198bf29bd9f" }, 
		{ "Uno.UI.Dispatching", "8dc58922-19e0-4e73-a5ea-ab295415e500" }, 
		{ "Uno.UI.FluentTheme", "fefdf5c8-895b-41bb-8911-bae38a560b32" }, 
		{ "Uno.UI.FluentTheme.v1", "d69a4abc-e3eb-4966-8158-fd1c0116e9a4" }, 
		{ "Uno.UI.FluentTheme.v2", "da55efde-b523-493a-afaa-89accd30cc5b" }, 
		{ "Uno.UI.Toolkit", "98364e21-0c7b-4e89-a0b6-c47769dc9c29" }, 
		{ "Uno.UI", "a73db4e7-568f-43ed-ae0d-4c1a50cb2417" }, 
		{ "Uno.Xaml", "9d2947b3-76c4-4c70-9576-9395075b5d5c" }, 
		{ "Uno", "0503e46f-1283-4398-b41e-5cbd64de7dff" }, 
		{ "Uno.UI.RemoteControl", "bc397dfe-a2e9-475d-bc30-9a57620861a1" }, 
		{ "Uno.UI.RemoteControl.Messaging", "84099220-a43f-4b0c-9d65-615d14258f3e" }, 
		{ "Uno.UI.Lottie", "c8aa279a-979e-4237-b6fd-2348691365d9" }, 
		{ "Microsoft.CSharp", "39be89a2-832f-4b1a-ac55-f019c295e496" }, 
		{ "System.Collections.Concurrent", "34e47eae-6fa9-4fef-8c19-4ef04fe95c78" }, 
		{ "System.Collections.Immutable", "342f6439-c951-47d6-9c1a-a7e31559fe5b" }, 
		{ "System.Collections.NonGeneric", "5a50a0b5-e12a-4750-ad58-038acb8abe0a" }, 
		{ "System.Collections.Specialized", "2ec98ded-b381-42a8-9809-33cdf31b31c2" }, 
		{ "System.Collections", "fee887c7-f0d5-474d-8731-1032de7c1258" }, 
		{ "System.ComponentModel.Primitives", "3014028f-bb98-43e0-bdfe-c9d80e9b910a" }, 
		{ "System.ComponentModel.TypeConverter", "1a16a799-2e83-4c33-9313-a1753fa11715" }, 
		{ "System.ComponentModel", "b7492d52-ff43-4330-8c23-1354606283d3" }, 
		{ "System.Console", "07c1410d-e54b-403f-b44e-fd02fe115414" }, 
		{ "System.Data.Common", "49c7c33d-0160-4477-a9e2-96c5be511dbe" }, 
		{ "System.Diagnostics.Debug", "24e8c01e-3135-4342-9657-270c0de8d1f7" }, 
		{ "System.Diagnostics.DiagnosticSource", "78e4c397-e73c-4a3b-b57a-63ab2eba66b5" }, 
		{ "System.Diagnostics.TraceSource", "08785060-afd0-4851-8864-c1e8c4fd37a9" }, 
		{ "System.Diagnostics.Tracing", "a5e3e518-0ecf-4f8a-a9a7-b65d11a9637d" }, 
		{ "System.Drawing.Primitives", "79c03ba3-5e61-40cb-809e-4396b009a000" }, 
		{ "System.Drawing", "2698caf1-80f1-4e30-9fdc-8b2e48c64155" }, 
		{ "System.Formats.Asn1", "0025064c-c9d2-4f2c-bbbb-2f33c127745b" }, 
		{ "System.IO.FileSystem.Watcher", "a3e94123-68dc-4dde-8523-8712e00de5b2" }, 
		{ "System.Linq.Expressions", "087ae2d5-2cb6-499f-bb2d-584ea910b3c0" }, 
		{ "System.Linq.Queryable", "526d7b54-a2cf-4485-a3c2-2aadce078f71" }, 
		{ "System.Linq", "e7eeee9d-c783-4f58-aa55-74a993bc5456" }, 
		{ "System.Memory", "0f967608-1a0a-4997-8f66-d8c9e462a9e7" }, 
		{ "System.Net.Http", "84adc1c4-14c7-4400-af0d-6c3f6a6470bf" }, 
		{ "System.Net.NameResolution", "c81623ff-b2e1-48c8-b212-b6e7043d1a04" }, 
		{ "System.Net.NetworkInformation", "0f821d78-01f5-4477-87ac-c0a277e5bfdb" }, 
		{ "System.Net.Primitives", "aa61a949-baeb-4e74-b47d-da6c3c7ec29d" }, 
		{ "System.Net.Requests", "c4738b39-06db-4930-bd22-e74ea1978c18" }, 
		{ "System.Net.Security", "bb4d4af6-f763-4f63-9fb3-1330ee3d79d9" }, 
		{ "System.Net.ServicePoint", "c78d3586-ef2c-4d40-ac3a-c7e643091fa2" }, 
		{ "System.Net.Sockets", "8365971b-a20f-4294-8739-d94a247897c0" }, 
		{ "System.Net.WebHeaderCollection", "5b144830-ec06-4132-ae75-e76e8442929b" }, 
		{ "System.Net.WebSockets.Client", "e979c7f8-cc0b-40d0-a49f-a78b1966fee6" }, 
		{ "System.Net.WebSockets", "b3cb5c57-ef2a-42a7-828c-219ff9d35fb6" }, 
		{ "System.Numerics.Vectors", "cbd85cc5-fa92-4c80-b4c3-dd2f7b91767a" }, 
		{ "System.ObjectModel", "96b17943-0c3c-4199-ba94-2bb6ebdcb948" }, 
		{ "System.Private.Uri", "e799d39c-0c24-42b5-900e-b49328acc138" }, 
		{ "System.Private.Xml.Linq", "d9fbf210-4a2b-42cb-8b77-ed64e10b0162" }, 
		{ "System.Private.Xml", "ca705b98-c646-46a9-8980-babd9db2cd40" }, 
		{ "System.Reflection.Emit.ILGeneration", "17022183-5396-4b52-a16d-99bd027ed994" }, 
		{ "System.Reflection.Emit.Lightweight", "3f473f7f-1d49-43dd-ac34-2203a56c8bff" }, 
		{ "System.Reflection.Primitives", "cb35b720-a0c8-4b8f-9539-01f956676501" }, 
		{ "System.Runtime.Extensions", "1396f3f1-1c24-41ef-8923-3fb70a482f0d" }, 
		{ "System.Runtime.InteropServices.JavaScript", "4894a143-82a1-48dc-a7c4-4d4318638ac6" }, 
		{ "System.Runtime.InteropServices", "7d972b85-d4f0-4a77-8632-431f58d2d9a0" }, 
		{ "System.Runtime.Loader", "a02767f1-2036-497a-bf23-eda123eec114" }, 
		{ "System.Runtime.Numerics", "941802de-734b-43f4-8adc-fd1b2175aa97" }, 
		{ "System.Runtime.Serialization.Formatters", "6d61ff8a-ec9c-453c-8c2f-fbad9162dfe4" }, 
		{ "System.Runtime.Serialization.Primitives", "e087815f-71ee-4da6-bc97-c08ae5f32574" }, 
		{ "System.Runtime", "56c78be5-5ef3-4e5d-a638-92dc509764ab" }, 
		{ "System.Security.Cryptography", "31aafb97-64a2-4915-bba1-0ddc4a55e9f0" }, 
		{ "System.Text.Encoding.Extensions", "4e716adb-709b-43ff-b84c-4d839bf51c0e" }, 
		{ "System.Text.Encodings.Web", "bbcc2a1d-2270-408b-b0a8-8d999ccac50d" }, 
		{ "System.Text.Json", "2e8954a7-0991-498d-95f6-9aedbbe162e8" }, 
		{ "System.Text.RegularExpressions", "c91cf427-72f7-4c3f-b319-002c2c9ada84" }, 
		{ "System.Threading.Channels", "88ed0d7a-791e-4742-ba02-1ee6a61bc3ef" }, 
		{ "System.Threading", "d5a12fc4-10de-4628-9b95-53bce2e9784f" }, 
		{ "System.Web.HttpUtility", "c377540d-ab71-4736-be93-7f79a9397852" }, 
		{ "System.Xml.Linq", "1eaa97bc-7d4e-4a5a-90e0-dce6ac3c3ee7" }, 
		{ "System.Xml.ReaderWriter", "1b8f3dc5-d3fd-461a-ab2c-dafa58228229" }, 
		{ "System.Xml.XDocument", "12b890e1-c059-42a6-bf21-5ed42317d686" }, 
		{ "System", "bf68e0a5-aa19-4ea9-a249-f2f813f2c284" }, 
		{ "netstandard", "6dea2ad5-eb1f-4d06-911d-0052b793f155" }, 
		{ "System.Private.CoreLib", "b46313ae-7789-4839-a14f-c80278df3f32" }, 
		{ "Microsoft.iOS", "76419036-82a4-49a7-b330-73703a8a18a4" }
	};

	static const MTFullTokenReference __xamarin_token_references [] = {
		{ /* #1 = 0x1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200008C /* Foundation.NSObject */ },
		{ /* #2 = 0x3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001EE /* UIKit.UIApplicationDelegate */ },
		{ /* #3 = 0x5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x600116E /* System.Void UIKit.UIApplicationDelegate::.ctor() */ },
		{ /* #4 = 0x7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000284 /* UIKit.IUIPasteConfigurationSupporting */ },
		{ /* #5 = 0x9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000285 /* UIKit.UIPasteConfigurationSupportingWrapper */ },
		{ /* #6 = 0xB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200029B /* UIKit.UIResponder */ },
		{ /* #7 = 0xD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000229 /* UIKit.IUICoordinateSpace */ },
		{ /* #8 = 0xF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200022A /* UIKit.UICoordinateSpaceWrapper */ },
		{ /* #9 = 0x11 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200024D /* UIKit.IUIFocusEnvironment */ },
		{ /* #10 = 0x13 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200024E /* UIKit.UIFocusEnvironmentWrapper */ },
		{ /* #11 = 0x15 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000250 /* UIKit.IUIFocusItem */ },
		{ /* #12 = 0x17 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000251 /* UIKit.UIFocusItemWrapper */ },
		{ /* #13 = 0x19 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000252 /* UIKit.IUIFocusItemContainer */ },
		{ /* #14 = 0x1B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000253 /* UIKit.UIFocusItemContainerWrapper */ },
		{ /* #15 = 0x1D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001AC /* UIKit.UIView */ },
		{ /* #16 = 0x1F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001DAA /* UIKit.UIApplicationRestorationHandler ObjCRuntime.Trampolines/NIDUIApplicationRestorationHandler::Create(System.IntPtr) */ },
		{ /* #17 = 0x21 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001DBF /* UIKit.UIOperationHandler ObjCRuntime.Trampolines/NIDUIOperationHandler::Create(System.IntPtr) */ },
		{ /* #18 = 0x23 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200002B /* GLKit.GLKView */ },
		{ /* #19 = 0x25 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200002D /* GLKit.IGLKViewDelegate */ },
		{ /* #20 = 0x27 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200002E /* GLKit.GLKViewDelegateWrapper */ },
		{ /* #21 = 0x29 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002A5 /* UIKit.IUIScrollViewDelegate */ },
		{ /* #22 = 0x2B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002A6 /* UIKit.UIScrollViewDelegateWrapper */ },
		{ /* #23 = 0x2D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002A7 /* UIKit.UIScrollViewDelegate */ },
		{ /* #24 = 0x2F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60015A1 /* System.Void UIKit.UIScrollViewDelegate::.ctor() */ },
		{ /* #25 = 0x31 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001AF /* UIKit.UIViewController */ },
		{ /* #26 = 0x33 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000196 /* UIKit.UINavigationController */ },
		{ /* #27 = 0x35 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200027E /* UIKit.IUINavigationControllerDelegate */ },
		{ /* #28 = 0x37 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200027F /* UIKit.UINavigationControllerDelegateWrapper */ },
		{ /* #29 = 0x39 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000280 /* UIKit.UINavigationControllerDelegate */ },
		{ /* #30 = 0x3B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001433 /* System.Void UIKit.UINavigationControllerDelegate::.ctor() */ },
		{ /* #31 = 0x3D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001FF /* UIKit.IUICollectionViewDataSource */ },
		{ /* #32 = 0x3F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000200 /* UIKit.UICollectionViewDataSourceWrapper */ },
		{ /* #33 = 0x41 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000203 /* UIKit.IUICollectionViewDelegate */ },
		{ /* #34 = 0x43 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000204 /* UIKit.UICollectionViewDelegateWrapper */ },
		{ /* #35 = 0x45 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000218 /* UIKit.UICollectionViewSource */ },
		{ /* #36 = 0x47 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001273 /* System.Void UIKit.UICollectionViewSource::.ctor() */ },
		{ /* #37 = 0x49 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200029F /* UIKit.UIScrollView */ },
		{ /* #38 = 0x4B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000179 /* UIKit.UICollectionView */ },
		{ /* #39 = 0x4D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000262 /* UIKit.UIImageView */ },
		{ /* #40 = 0x4F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200017A /* UIKit.UICollectionViewLayout */ },
		{ /* #41 = 0x51 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001FD /* UIKit.UICollectionReusableView */ },
		{ /* #42 = 0x53 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001FE /* UIKit.UICollectionViewCell */ },
		{ /* #43 = 0x55 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000286 /* UIKit.IUIPickerViewDataSource */ },
		{ /* #44 = 0x57 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000287 /* UIKit.UIPickerViewDataSourceWrapper */ },
		{ /* #45 = 0x59 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000288 /* UIKit.IUIPickerViewDelegate */ },
		{ /* #46 = 0x5B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000289 /* UIKit.UIPickerViewDelegateWrapper */ },
		{ /* #47 = 0x5D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200028A /* UIKit.UIPickerViewModel */ },
		{ /* #48 = 0x5F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x600146D /* System.Void UIKit.UIPickerViewModel::.ctor() */ },
		{ /* #49 = 0x61 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000306 /* UIKit.IUITextViewDelegate */ },
		{ /* #50 = 0x63 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000307 /* UIKit.UITextViewDelegateWrapper */ },
		{ /* #51 = 0x65 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000308 /* UIKit.UITextViewDelegate */ },
		{ /* #52 = 0x67 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60018A9 /* System.Void UIKit.UITextViewDelegate::.ctor() */ },
		{ /* #53 = 0x69 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200004B /* WebKit.IWKUIDelegate */ },
		{ /* #54 = 0x6B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200004C /* WebKit.WKUIDelegateWrapper */ },
		{ /* #55 = 0x6D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200004D /* WebKit.WKUIDelegate */ },
		{ /* #56 = 0x6F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000272 /* System.Void WebKit.WKUIDelegate::.ctor() */ },
		{ /* #57 = 0x71 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001D16 /* System.Action ObjCRuntime.Trampolines/NIDAction::Create(System.IntPtr) */ },
		{ /* #58 = 0x73 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001D4F /* System.Action`1<System.String> ObjCRuntime.Trampolines/NIDActionArity1V70::Create(System.IntPtr) */ },
		{ /* #59 = 0x75 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001D48 /* System.Action`1<System.Boolean> ObjCRuntime.Trampolines/NIDActionArity1V4::Create(System.IntPtr) */ },
		{ /* #60 = 0x77 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200002F /* WebKit.WKWebView */ },
		{ /* #61 = 0x79 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000048 /* WebKit.IWKScriptMessageHandler */ },
		{ /* #62 = 0x7B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000049 /* WebKit.WKScriptMessageHandlerWrapper */ },
		{ /* #63 = 0x7D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200017F /* UIKit.UIControl */ },
		{ /* #64 = 0x7F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200029A /* UIKit.UIRefreshControl */ },
		{ /* #65 = 0x81 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200025C /* UIKit.UIGestureRecognizerDelegate */ },
		{ /* #66 = 0x83 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60013BC /* System.Void UIKit.UIGestureRecognizerDelegate::.ctor() */ },
		{ /* #67 = 0x85 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000326 /* UIKit.UIViewControllerTransitioningDelegate */ },
		{ /* #68 = 0x87 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001965 /* System.Void UIKit.UIViewControllerTransitioningDelegate::.ctor() */ },
		{ /* #69 = 0x89 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001DF /* UIKit.UIActivityIndicatorView */ },
		{ /* #70 = 0x8B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000131 /* CoreAnimation.CALayer */ },
		{ /* #71 = 0x8D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000199 /* UIKit.UIPickerView */ },
		{ /* #72 = 0x8F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002EE /* UIKit.IUITextInputTraits */ },
		{ /* #73 = 0x91 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002EF /* UIKit.UITextInputTraitsWrapper */ },
		{ /* #74 = 0x93 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000270 /* UIKit.IUIKeyInput */ },
		{ /* #75 = 0x95 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000271 /* UIKit.UIKeyInputWrapper */ },
		{ /* #76 = 0x97 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002E5 /* UIKit.IUITextInput */ },
		{ /* #77 = 0x99 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002E6 /* UIKit.UITextInputWrapper */ },
		{ /* #78 = 0x9B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002CF /* UIKit.IUITextDraggable */ },
		{ /* #79 = 0x9D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002D0 /* UIKit.UITextDraggableWrapper */ },
		{ /* #80 = 0x9F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002F5 /* UIKit.IUITextPasteConfigurationSupporting */ },
		{ /* #81 = 0xA1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002F6 /* UIKit.UITextPasteConfigurationSupportingWrapper */ },
		{ /* #82 = 0xA3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002D7 /* UIKit.IUITextDroppable */ },
		{ /* #83 = 0xA5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002D8 /* UIKit.UITextDroppableWrapper */ },
		{ /* #84 = 0xA7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001A8 /* UIKit.UITextView */ },
		{ /* #85 = 0xA9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002DC /* UIKit.IUITextFieldDelegate */ },
		{ /* #86 = 0xAB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002DD /* UIKit.UITextFieldDelegateWrapper */ },
		{ /* #87 = 0xAD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002DE /* UIKit.UITextFieldDelegate */ },
		{ /* #88 = 0xAF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001731 /* System.Void UIKit.UITextFieldDelegate::.ctor() */ },
		{ /* #89 = 0xB1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001A6 /* UIKit.UITextField */ },
		{ /* #90 = 0xB3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200003D /* WebKit.IWKNavigationDelegate */ },
		{ /* #91 = 0xB5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200003E /* WebKit.WKNavigationDelegateWrapper */ },
		{ /* #92 = 0xB7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200003F /* WebKit.WKNavigationDelegate */ },
		{ /* #93 = 0xB9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000224 /* System.Void WebKit.WKNavigationDelegate::.ctor() */ },
		{ /* #94 = 0xBB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001D82 /* System.Action`1<WebKit.WKNavigationActionPolicy> ObjCRuntime.Trampolines/NIDActionArity1V279::Create(System.IntPtr) */ },
		{ /* #95 = 0xBD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001D89 /* System.Action`1<WebKit.WKNavigationResponsePolicy> ObjCRuntime.Trampolines/NIDActionArity1V280::Create(System.IntPtr) */ },
		{ /* #96 = 0xBF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000168 /* UIKit.UIAlertView */ },
		{ /* #97 = 0xC1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000178 /* UIKit.UIButton */ },
		{ /* #98 = 0xC3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000297 /* UIKit.UIProgressView */ },
		{ /* #99 = 0xC5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002BB /* UIKit.UISwitch */ },
		{ /* #100 = 0xC7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200019F /* UIKit.UISearchBar */ },
		{ /* #101 = 0xC9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002B2 /* UIKit.UISlider */ },
		{ /* #102 = 0xCB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000195 /* UIKit.UINavigationBar */ },
		{ /* #103 = 0xCD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001B5 /* UIKit.UIWindow */ },
		{ /* #104 = 0xCF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200025F /* UIKit.UIImagePickerControllerDelegate */ },
		{ /* #105 = 0xD1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60013C7 /* System.Void UIKit.UIImagePickerControllerDelegate::.ctor() */ },
		{ /* #106 = 0xD3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200015A /* CallKit.ICXCallObserverDelegate */ },
		{ /* #107 = 0xD5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200015B /* CallKit.CXCallObserverDelegateWrapper */ },
		{ /* #108 = 0xD7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200015C /* CallKit.CXCallObserverDelegate */ },
		{ /* #109 = 0xD9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000A20 /* System.Void CallKit.CXCallObserverDelegate::.ctor() */ },
		{ /* #110 = 0xDB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200015F /* AuthenticationServices.IASWebAuthenticationPresentationContextProviding */ },
		{ /* #111 = 0xDD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000160 /* AuthenticationServices.ASWebAuthenticationPresentationContextProvidingWrapper */ },
		{ /* #112 = 0xDF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001E5 /* UIKit.UIAdaptivePresentationControllerDelegate */ },
		{ /* #113 = 0xE1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001147 /* System.Void UIKit.UIAdaptivePresentationControllerDelegate::.ctor() */ },
		{ /* #114 = 0xE3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000233 /* UIKit.UIDocumentPickerDelegate */ },
		{ /* #115 = 0xE5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001307 /* System.Void UIKit.UIDocumentPickerDelegate::.ctor() */ },
		{ /* #116 = 0xE7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200018E /* UIKit.UIImagePickerController */ },
		{ /* #117 = 0xE9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000F3 /* CoreLocation.ICLLocationManagerDelegate */ },
		{ /* #118 = 0xEB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000F4 /* CoreLocation.CLLocationManagerDelegateWrapper */ },
		{ /* #119 = 0xED */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001E3 /* UIKit.UIActivityItemSource */ },
		{ /* #120 = 0xEF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x600113F /* System.Void UIKit.UIActivityItemSource::.ctor() */ },
		{ /* #121 = 0xF1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000005 /* ContactsUI.CNContactPickerDelegate */ },
		{ /* #122 = 0xF3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x600000D /* System.Void ContactsUI.CNContactPickerDelegate::.ctor() */ },
		{ /* #123 = 0xF5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000004 /* PhotosUI.PHPickerViewControllerDelegate */ },
		{ /* #124 = 0xF7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x600000A /* System.Void PhotosUI.PHPickerViewControllerDelegate::.ctor() */ },
		{ /* #125 = 0xF9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000002 /* PhotosUI.PHPickerResult */ },
		{ /* #126 = 0xFB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000003 /* PhotosUI.PHPickerViewController */ },
		{ /* #127 = 0xFD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000006 /* ContactsUI.CNContactPickerViewController */ },
		{ /* #128 = 0xFF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000013 /* OpenGLES.EAGLContext */ },
		{ /* #129 = 0x101 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000023 /* MessageUI.MFMailComposeViewController */ },
		{ /* #130 = 0x103 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000026 /* MessageUI.MFMailComposeViewControllerDelegate */ },
		{ /* #131 = 0x105 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60001A9 /* System.Void MessageUI.MFMailComposeViewControllerDelegate::.ctor() */ },
		{ /* #132 = 0x107 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000024 /* MessageUI.Mono_MFMailComposeViewControllerDelegate */ },
		{ /* #133 = 0x109 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60001A8 /* System.Void MessageUI.Mono_MFMailComposeViewControllerDelegate::Finished(MessageUI.MFMailComposeViewController,MessageUI.MFMailComposeResult,Foundation.NSError) */ },
		{ /* #134 = 0x10B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60001A7 /* System.Void MessageUI.Mono_MFMailComposeViewControllerDelegate::.ctor() */ },
		{ /* #135 = 0x10D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000030 /* WebKit.WKPreferences */ },
		{ /* #136 = 0x10F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000031 /* WebKit.WKWindowFeatures */ },
		{ /* #137 = 0x111 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000033 /* WebKit.WKBackForwardList */ },
		{ /* #138 = 0x113 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000034 /* WebKit.WKBackForwardListItem */ },
		{ /* #139 = 0x115 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000035 /* WebKit.WKContextMenuElementInfo */ },
		{ /* #140 = 0x117 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000037 /* WebKit.WKDownload */ },
		{ /* #141 = 0x119 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000B3 /* Foundation.INSCopying */ },
		{ /* #142 = 0x11B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000B4 /* Foundation.NSCopyingWrapper */ },
		{ /* #143 = 0x11D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000038 /* WebKit.WKFrameInfo */ },
		{ /* #144 = 0x11F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200003A /* WebKit.WKNavigation */ },
		{ /* #145 = 0x121 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200003B /* WebKit.WKNavigationAction */ },
		{ /* #146 = 0x123 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000040 /* WebKit.WKNavigationResponse */ },
		{ /* #147 = 0x125 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000044 /* WebKit.IWKPreviewActionItem */ },
		{ /* #148 = 0x127 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000045 /* WebKit.WKPreviewActionItemWrapper */ },
		{ /* #149 = 0x129 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000046 /* WebKit.WKPreviewElementInfo */ },
		{ /* #150 = 0x12B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000047 /* WebKit.WKScriptMessage */ },
		{ /* #151 = 0x12D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200004A /* WebKit.WKSecurityOrigin */ },
		{ /* #152 = 0x12F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200004E /* WebKit.WKUserContentController */ },
		{ /* #153 = 0x131 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200004F /* WebKit.WKWebpagePreferences */ },
		{ /* #154 = 0x133 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000050 /* WebKit.WKWebViewConfiguration */ },
		{ /* #155 = 0x135 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000051 /* Foundation.NSIndexPath */ },
		{ /* #156 = 0x137 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000059 /* Foundation.NSDispatcher */ },
		{ /* #157 = 0x139 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60002B2 /* System.Void Foundation.NSDispatcher::Apply() */ },
		{ /* #158 = 0x13B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60002B1 /* System.Void Foundation.NSDispatcher::.ctor() */ },
		{ /* #159 = 0x13D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200005A /* Foundation.NSActionDispatcher */ },
		{ /* #160 = 0x13F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60002B5 /* System.Void Foundation.NSActionDispatcher::Apply() */ },
		{ /* #161 = 0x141 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200005B /* Foundation.NSSynchronizationContextDispatcher */ },
		{ /* #162 = 0x143 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60002B7 /* System.Void Foundation.NSSynchronizationContextDispatcher::Apply() */ },
		{ /* #163 = 0x145 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200005C /* Foundation.NSAsyncDispatcher */ },
		{ /* #164 = 0x147 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60002B9 /* System.Void Foundation.NSAsyncDispatcher::Apply() */ },
		{ /* #165 = 0x149 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60002B8 /* System.Void Foundation.NSAsyncDispatcher::.ctor() */ },
		{ /* #166 = 0x14B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200005D /* Foundation.NSAsyncActionDispatcher */ },
		{ /* #167 = 0x14D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60002BB /* System.Void Foundation.NSAsyncActionDispatcher::Apply() */ },
		{ /* #168 = 0x14F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200005E /* Foundation.NSAsyncSynchronizationContextDispatcher */ },
		{ /* #169 = 0x151 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60002BD /* System.Void Foundation.NSAsyncSynchronizationContextDispatcher::Apply() */ },
		{ /* #170 = 0x153 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000C0 /* Foundation.INSMutableCopying */ },
		{ /* #171 = 0x155 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000C1 /* Foundation.NSMutableCopyingWrapper */ },
		{ /* #172 = 0x157 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200005F /* Foundation.NSArray */ },
		{ /* #173 = 0x159 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000BB /* Foundation.INSItemProviderReading */ },
		{ /* #174 = 0x15B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000BC /* Foundation.NSItemProviderReadingWrapper */ },
		{ /* #175 = 0x15D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000060 /* Foundation.NSAttributedString */ },
		{ /* #176 = 0x15F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000061 /* Foundation.NSBundle */ },
		{ /* #177 = 0x161 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000063 /* Foundation.NSCalendar */ },
		{ /* #178 = 0x163 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000064 /* Foundation.NSCoder */ },
		{ /* #179 = 0x165 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200006A /* Foundation.NSDate */ },
		{ /* #180 = 0x167 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200006B /* Foundation.NSDateComponents */ },
		{ /* #181 = 0x169 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000070 /* Foundation.NSError */ },
		{ /* #182 = 0x16B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000072 /* Foundation.NSExceptionError */ },
		{ /* #183 = 0x16D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000076 /* Foundation.NSFileManager */ },
		{ /* #184 = 0x16F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000077 /* Foundation.NSHttpCookie */ },
		{ /* #185 = 0x171 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200009C /* Foundation.NSStream */ },
		{ /* #186 = 0x173 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000078 /* Foundation.NSInputStream */ },
		{ /* #187 = 0x175 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200007B /* Foundation.NSLocale */ },
		{ /* #188 = 0x177 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200007C /* Foundation.NSMutableAttributedString */ },
		{ /* #189 = 0x179 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000099 /* Foundation.NSSet */ },
		{ /* #190 = 0x17B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000082 /* Foundation.NSMutableSet */ },
		{ /* #191 = 0x17D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000084 /* Foundation.NSUrlRequest */ },
		{ /* #192 = 0x17F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000085 /* Foundation.NSMutableUrlRequest */ },
		{ /* #193 = 0x181 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000086 /* Foundation.InternalNSNotificationHandler */ },
		{ /* #194 = 0x183 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000485 /* System.Void Foundation.InternalNSNotificationHandler::Post(Foundation.NSNotification) */ },
		{ /* #195 = 0x185 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200008A /* Foundation.NSNull */ },
		{ /* #196 = 0x187 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000A8 /* Foundation.NSValue */ },
		{ /* #197 = 0x189 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200008B /* Foundation.NSNumber */ },
		{ /* #198 = 0x18B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000094 /* Foundation.NSProgress */ },
		{ /* #199 = 0x18D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000095 /* Foundation.NSProxy */ },
		{ /* #200 = 0x18F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000097 /* Foundation.NSRunLoop */ },
		{ /* #201 = 0x191 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200009D /* Foundation.NSString */ },
		{ /* #202 = 0x193 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200009E /* Foundation.NSThread */ },
		{ /* #203 = 0x195 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200009F /* Foundation.NSTimeZone */ },
		{ /* #204 = 0x197 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000A0 /* Foundation.NSTimer */ },
		{ /* #205 = 0x199 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000A1 /* Foundation.NSUndoManager */ },
		{ /* #206 = 0x19B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000A2 /* Foundation.NSUrl */ },
		{ /* #207 = 0x19D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000A3 /* Foundation.NSUrlCredential */ },
		{ /* #208 = 0x19F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000A4 /* Foundation.NSUrlProtectionSpace */ },
		{ /* #209 = 0x1A1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000A7 /* Foundation.NSUserDefaults */ },
		{ /* #210 = 0x1A3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000AF /* Foundation.NSAutoreleasePool */ },
		{ /* #211 = 0x1A5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000B0 /* Foundation.NSCachedUrlResponse */ },
		{ /* #212 = 0x1A7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000B5 /* Foundation.NSEnumerator */ },
		{ /* #213 = 0x1A9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000B6 /* Foundation.NSException */ },
		{ /* #214 = 0x1AB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000B8 /* Foundation.NSHttpCookieStorage */ },
		{ /* #215 = 0x1AD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000D1 /* Foundation.NSUrlResponse */ },
		{ /* #216 = 0x1AF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000B9 /* Foundation.NSHttpUrlResponse */ },
		{ /* #217 = 0x1B1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000BA /* Foundation.NSIndexSet */ },
		{ /* #218 = 0x1B3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000BD /* Foundation.NSJsonSerialization */ },
		{ /* #219 = 0x1B5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000C2 /* Foundation.NSNotification */ },
		{ /* #220 = 0x1B7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000C3 /* Foundation.NSOperationQueue */ },
		{ /* #221 = 0x1B9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000C4 /* Foundation.NSProcessInfo */ },
		{ /* #222 = 0x1BB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000C9 /* Foundation.NSStringDrawingContext */ },
		{ /* #223 = 0x1BD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000CD /* Foundation.NSUrlAuthenticationChallenge */ },
		{ /* #224 = 0x1BF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000D8 /* Foundation.INSUrlSessionDelegate */ },
		{ /* #225 = 0x1C1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000D9 /* Foundation.NSUrlSessionDelegateWrapper */ },
		{ /* #226 = 0x1C3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000DA /* Foundation.NSUrlSessionDelegate */ },
		{ /* #227 = 0x1C5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000DD /* Foundation.NSUrlSessionTaskDelegate */ },
		{ /* #228 = 0x1C7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000D6 /* Foundation.NSUrlSessionDataDelegate */ },
		{ /* #229 = 0x1C9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000692 /* System.Void Foundation.NSUrlSessionDataDelegate::.ctor() */ },
		{ /* #230 = 0x1CB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000DC /* Foundation.NSUrlSessionTask */ },
		{ /* #231 = 0x1CD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000D7 /* Foundation.NSUrlSessionDataTask */ },
		{ /* #232 = 0x1CF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000DF /* Foundation.NSUserActivity */ },
		{ /* #233 = 0x1D1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000EB /* CoreLocation.CLLocationManager */ },
		{ /* #234 = 0x1D3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000ED /* CoreLocation.CLBeacon */ },
		{ /* #235 = 0x1D5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000EE /* CoreLocation.CLBeaconIdentityConstraint */ },
		{ /* #236 = 0x1D7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000F5 /* CoreLocation.CLRegion */ },
		{ /* #237 = 0x1D9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000EF /* CoreLocation.CLBeaconRegion */ },
		{ /* #238 = 0x1DB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000F0 /* CoreLocation.CLHeading */ },
		{ /* #239 = 0x1DD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000F1 /* CoreLocation.CLLocation */ },
		{ /* #240 = 0x1DF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000F7 /* CoreLocation.CLVisit */ },
		{ /* #241 = 0x1E1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200012D /* CoreAnimation.CAAnimation */ },
		{ /* #242 = 0x1E3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200013B /* CoreAnimation.CAPropertyAnimation */ },
		{ /* #243 = 0x1E5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200012C /* CoreAnimation.CABasicAnimation */ },
		{ /* #244 = 0x1E7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200012F /* CoreAnimation.CAGradientLayer */ },
		{ /* #245 = 0x1E9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000130 /* CoreAnimation.CAKeyFrameAnimation */ },
		{ /* #246 = 0x1EB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000132 /* CoreAnimation.CADisplayLink */ },
		{ /* #247 = 0x1ED */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000133 /* CoreAnimation.CALayerDelegate */ },
		{ /* #248 = 0x1EF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000134 /* CoreAnimation.CAMediaTimingFunction */ },
		{ /* #249 = 0x1F1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000137 /* CoreAnimation.ICAAnimationDelegate */ },
		{ /* #250 = 0x1F3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000138 /* CoreAnimation.CAAnimationDelegateWrapper */ },
		{ /* #251 = 0x1F5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200013C /* CoreAnimation.CAShapeLayer */ },
		{ /* #252 = 0x1F7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200013D /* CoreAnimation.CATransaction */ },
		{ /* #253 = 0x1F9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200013E /* Contacts.CNContact */ },
		{ /* #254 = 0x1FB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000158 /* CallKit.CXCall */ },
		{ /* #255 = 0x1FD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000159 /* CallKit.CXCallObserver */ },
		{ /* #256 = 0x1FF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000161 /* AuthenticationServices.ASWebAuthenticationSession */ },
		{ /* #257 = 0x201 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000162 /* UIKit.NSLayoutManager */ },
		{ /* #258 = 0x203 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000163 /* UIKit.NSLayoutConstraint */ },
		{ /* #259 = 0x205 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000164 /* UIKit.UIAccessibilityCustomAction */ },
		{ /* #260 = 0x207 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200016A /* UIKit.UIAppearance */ },
		{ /* #261 = 0x209 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000176 /* UIKit.UIBarItem */ },
		{ /* #262 = 0x20B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000177 /* UIKit.UIBezierPath */ },
		{ /* #263 = 0x20D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200017B /* UIKit.UICollectionViewLayoutAttributes */ },
		{ /* #264 = 0x20F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200017C /* UIKit.UIColor */ },
		{ /* #265 = 0x211 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200017E /* UIKit.UIControlEventProxy */ },
		{ /* #266 = 0x213 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000BF2 /* System.Void UIKit.UIControlEventProxy::Activated() */ },
		{ /* #267 = 0x215 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000181 /* UIKit.UIDevice */ },
		{ /* #268 = 0x217 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000182 /* UIKit.UIEvent */ },
		{ /* #269 = 0x219 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000184 /* UIKit.UIFont */ },
		{ /* #270 = 0x21B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000186 /* UIKit.UIFontDescriptor */ },
		{ /* #271 = 0x21D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000187 /* UIKit.UIGestureRecognizer */ },
		{ /* #272 = 0x21F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200018A /* UIKit.UIPanGestureRecognizer */ },
		{ /* #273 = 0x221 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200018B /* UIKit.UIPinchGestureRecognizer */ },
		{ /* #274 = 0x223 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200018D /* UIKit.UIImage */ },
		{ /* #275 = 0x225 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000277 /* UIKit.UIMenuElement */ },
		{ /* #276 = 0x227 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000194 /* UIKit.UIMenu */ },
		{ /* #277 = 0x229 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000198 /* UIKit.UIPasteboard */ },
		{ /* #278 = 0x22B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001AB /* UIKit.UIPresentationController */ },
		{ /* #279 = 0x22D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200019C /* UIKit.UIPopoverPresentationController */ },
		{ /* #280 = 0x22F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200019D /* UIKit.UIScreen */ },
		{ /* #281 = 0x231 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001AA /* UIKit.UIToolbar */ },
		{ /* #282 = 0x233 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200029D /* UIKit.UIScene */ },
		{ /* #283 = 0x235 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001B1 /* UIKit.UIWindowScene */ },
		{ /* #284 = 0x237 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001B2 /* UIKit.UITraitCollection */ },
		{ /* #285 = 0x239 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001B3 /* UIKit.IUITraitOverrides */ },
		{ /* #286 = 0x23B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000313 /* UIKit.UITraitOverridesWrapper */ },
		{ /* #287 = 0x23D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001C9 /* UIKit.NSAdaptiveImageGlyph */ },
		{ /* #288 = 0x23F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001CA /* UIKit.NSLayoutAnchor`1 */ },
		{ /* #289 = 0x241 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001CB /* UIKit.NSLayoutDimension */ },
		{ /* #290 = 0x243 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001CC /* UIKit.NSLayoutXAxisAnchor */ },
		{ /* #291 = 0x245 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001CD /* UIKit.NSLayoutYAxisAnchor */ },
		{ /* #292 = 0x247 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001CF /* UIKit.NSParagraphStyle */ },
		{ /* #293 = 0x249 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001CE /* UIKit.NSMutableParagraphStyle */ },
		{ /* #294 = 0x24B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001D0 /* UIKit.NSTextAttachment */ },
		{ /* #295 = 0x24D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001D1 /* UIKit.NSTextContainer */ },
		{ /* #296 = 0x24F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001D2 /* UIKit.NSTextLayoutManager */ },
		{ /* #297 = 0x251 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001D3 /* UIKit.NSTextStorage */ },
		{ /* #298 = 0x253 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001D7 /* UIKit.UIAccessibilityLocationDescriptor */ },
		{ /* #299 = 0x255 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001DA /* UIKit.UIAction */ },
		{ /* #300 = 0x257 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001DC /* UIKit.IUIActionSheetDelegate */ },
		{ /* #301 = 0x259 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001DD /* UIKit.UIActionSheetDelegateWrapper */ },
		{ /* #302 = 0x25B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001DE /* UIKit.UIActivity */ },
		{ /* #303 = 0x25D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001E1 /* UIKit.IUIActivityItemsConfigurationReading */ },
		{ /* #304 = 0x25F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001E2 /* UIKit.UIActivityItemsConfigurationReadingWrapper */ },
		{ /* #305 = 0x261 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001E4 /* UIKit.UIActivityViewController */ },
		{ /* #306 = 0x263 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001E6 /* UIKit.UIAlertAction */ },
		{ /* #307 = 0x265 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001E8 /* UIKit.UIAlertController */ },
		{ /* #308 = 0x267 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001EA /* UIKit.IUIAlertViewDelegate */ },
		{ /* #309 = 0x269 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001EB /* UIKit.UIAlertViewDelegateWrapper */ },
		{ /* #310 = 0x26B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001EC /* UIKit.UIAlertViewDelegate */ },
		{ /* #311 = 0x26D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001EF /* UIKit.UIApplicationShortcutItem */ },
		{ /* #312 = 0x26F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001F0 /* UIKit.UIBarAppearance */ },
		{ /* #313 = 0x271 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001F1 /* UIKit.UIBarButtonItemAppearance */ },
		{ /* #314 = 0x273 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001F2 /* UIKit.UIBarButtonItemStateAppearance */ },
		{ /* #315 = 0x275 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200032B /* UIKit.UIVisualEffect */ },
		{ /* #316 = 0x277 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001F8 /* UIKit.UIBlurEffect */ },
		{ /* #317 = 0x279 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001FA /* UIKit.UIButtonConfiguration */ },
		{ /* #318 = 0x27B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000201 /* UIKit.IUICollectionViewDataSourcePrefetching */ },
		{ /* #319 = 0x27D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000202 /* UIKit.UICollectionViewDataSourcePrefetchingWrapper */ },
		{ /* #320 = 0x27F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000205 /* UIKit.IUICollectionViewDragDelegate */ },
		{ /* #321 = 0x281 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000206 /* UIKit.UICollectionViewDragDelegateWrapper */ },
		{ /* #322 = 0x283 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000207 /* UIKit.IUICollectionViewDropCoordinator */ },
		{ /* #323 = 0x285 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000208 /* UIKit.UICollectionViewDropCoordinatorWrapper */ },
		{ /* #324 = 0x287 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000209 /* UIKit.IUICollectionViewDropDelegate */ },
		{ /* #325 = 0x289 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200020A /* UIKit.UICollectionViewDropDelegateWrapper */ },
		{ /* #326 = 0x28B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200020B /* UIKit.IUICollectionViewDropItem */ },
		{ /* #327 = 0x28D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200020C /* UIKit.UICollectionViewDropItemWrapper */ },
		{ /* #328 = 0x28F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000213 /* UIKit.UICollectionViewPlaceholder */ },
		{ /* #329 = 0x291 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200020D /* UIKit.UICollectionViewDropPlaceholder */ },
		{ /* #330 = 0x293 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000235 /* UIKit.IUIDragAnimating */ },
		{ /* #331 = 0x295 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000236 /* UIKit.UIDragAnimatingWrapper */ },
		{ /* #332 = 0x297 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200020E /* UIKit.IUICollectionViewDropPlaceholderContext */ },
		{ /* #333 = 0x299 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200020F /* UIKit.UICollectionViewDropPlaceholderContextWrapper */ },
		{ /* #334 = 0x29B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200023F /* UIKit.UIDropProposal */ },
		{ /* #335 = 0x29D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000210 /* UIKit.UICollectionViewDropProposal */ },
		{ /* #336 = 0x29F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000211 /* UIKit.UICollectionViewFlowLayout */ },
		{ /* #337 = 0x2A1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000256 /* UIKit.UIFocusUpdateContext */ },
		{ /* #338 = 0x2A3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000212 /* UIKit.UICollectionViewFocusUpdateContext */ },
		{ /* #339 = 0x2A5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000219 /* UIKit.UICollectionViewTransitionLayout */ },
		{ /* #340 = 0x2A7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200021A /* UIKit.UICollectionViewUpdateItem */ },
		{ /* #341 = 0x2A9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200021B /* UIKit.UICommand */ },
		{ /* #342 = 0x2AB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200021D /* UIKit.UIContextMenuConfiguration */ },
		{ /* #343 = 0x2AD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000266 /* UIKit.IUIInteraction */ },
		{ /* #344 = 0x2AF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000267 /* UIKit.UIInteractionWrapper */ },
		{ /* #345 = 0x2B1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200021F /* UIKit.UIContextMenuInteraction */ },
		{ /* #346 = 0x2B3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000220 /* UIKit.IUIContextMenuInteractionAnimating */ },
		{ /* #347 = 0x2B5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000221 /* UIKit.UIContextMenuInteractionAnimatingWrapper */ },
		{ /* #348 = 0x2B7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000222 /* UIKit.IUIContextMenuInteractionCommitAnimating */ },
		{ /* #349 = 0x2B9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000223 /* UIKit.UIContextMenuInteractionCommitAnimatingWrapper */ },
		{ /* #350 = 0x2BB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000309 /* UIKit.IUITimingCurveProvider */ },
		{ /* #351 = 0x2BD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200030A /* UIKit.UITimingCurveProviderWrapper */ },
		{ /* #352 = 0x2BF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200022B /* UIKit.UICubicTimingParameters */ },
		{ /* #353 = 0x2C1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000232 /* UIKit.UIDocument */ },
		{ /* #354 = 0x2C3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000234 /* UIKit.UIDocumentPickerViewController */ },
		{ /* #355 = 0x2C5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000237 /* UIKit.UIDragInteraction */ },
		{ /* #356 = 0x2C7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000238 /* UIKit.UIDragItem */ },
		{ /* #357 = 0x2C9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000294 /* UIKit.UIPreviewParameters */ },
		{ /* #358 = 0x2CB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000239 /* UIKit.UIDragPreviewParameters */ },
		{ /* #359 = 0x2CD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000295 /* UIKit.UIPreviewTarget */ },
		{ /* #360 = 0x2CF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200023A /* UIKit.UIDragPreviewTarget */ },
		{ /* #361 = 0x2D1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200023B /* UIKit.IUIDragSession */ },
		{ /* #362 = 0x2D3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200023C /* UIKit.UIDragSessionWrapper */ },
		{ /* #363 = 0x2D5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200023D /* UIKit.UIDropInteraction */ },
		{ /* #364 = 0x2D7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000240 /* UIKit.IUIDropSession */ },
		{ /* #365 = 0x2D9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000241 /* UIKit.UIDropSessionWrapper */ },
		{ /* #366 = 0x2DB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000245 /* UIKit.IUIEditMenuInteractionAnimating */ },
		{ /* #367 = 0x2DD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000246 /* UIKit.UIEditMenuInteractionAnimatingWrapper */ },
		{ /* #368 = 0x2DF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000249 /* UIKit.UIFeedbackGenerator */ },
		{ /* #369 = 0x2E1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200024A /* UIKit.UIFindInteraction */ },
		{ /* #370 = 0x2E3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200024B /* UIKit.UIFocusAnimationCoordinator */ },
		{ /* #371 = 0x2E5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200024C /* UIKit.UIFocusEffect */ },
		{ /* #372 = 0x2E7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000255 /* UIKit.UIFocusMovementHint */ },
		{ /* #373 = 0x2E9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200025D /* UIKit.UIHoverStyle */ },
		{ /* #374 = 0x2EB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200025E /* UIKit.UIImageConfiguration */ },
		{ /* #375 = 0x2ED */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000261 /* UIKit.UIImageSymbolConfiguration */ },
		{ /* #376 = 0x2EF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000263 /* UIKit.UIImpactFeedbackGenerator */ },
		{ /* #377 = 0x2F1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002E8 /* UIKit.IUITextInputDelegate */ },
		{ /* #378 = 0x2F3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002E9 /* UIKit.UITextInputDelegateWrapper */ },
		{ /* #379 = 0x2F5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000265 /* UIKit.UIInputViewController */ },
		{ /* #380 = 0x2F7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200026A /* UIKit.UIKey */ },
		{ /* #381 = 0x2F9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000274 /* UIKit.UILayoutGuide */ },
		{ /* #382 = 0x2FB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000310 /* UIKit.UITrackingLayoutGuide */ },
		{ /* #383 = 0x2FD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200026D /* UIKit.UIKeyboardLayoutGuide */ },
		{ /* #384 = 0x2FF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200026F /* UIKit.UIKeyCommand */ },
		{ /* #385 = 0x301 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000273 /* UIKit.UILabel */ },
		{ /* #386 = 0x303 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000279 /* UIKit.UIMotionEffect */ },
		{ /* #387 = 0x305 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200027A /* UIKit.UINavigationBarAppearance */ },
		{ /* #388 = 0x307 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200027B /* UIKit.IUINavigationBarDelegate */ },
		{ /* #389 = 0x309 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200027C /* UIKit.UINavigationBarDelegateWrapper */ },
		{ /* #390 = 0x30B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000282 /* UIKit.UINavigationItem */ },
		{ /* #391 = 0x30D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000283 /* UIKit.UIPasteConfiguration */ },
		{ /* #392 = 0x30F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200028B /* UIKit.UIPointerEffect */ },
		{ /* #393 = 0x311 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200028C /* UIKit.UIPointerShape */ },
		{ /* #394 = 0x313 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200028D /* UIKit.UIPointerStyle */ },
		{ /* #395 = 0x315 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000290 /* UIKit.IUIPopoverControllerDelegate */ },
		{ /* #396 = 0x317 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000291 /* UIKit.UIPopoverControllerDelegateWrapper */ },
		{ /* #397 = 0x319 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000292 /* UIKit.UIPress */ },
		{ /* #398 = 0x31B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000293 /* UIKit.UIPressesEvent */ },
		{ /* #399 = 0x31D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000296 /* UIKit.UIPrintFormatter */ },
		{ /* #400 = 0x31F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002AD /* UIKit.IUISearchBarDelegate */ },
		{ /* #401 = 0x321 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002AE /* UIKit.UISearchBarDelegateWrapper */ },
		{ /* #402 = 0x323 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002B0 /* UIKit.UISearchTextField */ },
		{ /* #403 = 0x325 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002B3 /* UIKit.IUISpringLoadedInteractionContext */ },
		{ /* #404 = 0x327 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002B4 /* UIKit.UISpringLoadedInteractionContextWrapper */ },
		{ /* #405 = 0x329 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002B6 /* UIKit.UISpringTimingParameters */ },
		{ /* #406 = 0x32B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002B7 /* UIKit.UIStatusBarManager */ },
		{ /* #407 = 0x32D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002B9 /* UIKit.UIStoryboard */ },
		{ /* #408 = 0x32F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002C2 /* UIKit.IUITabBarDelegate */ },
		{ /* #409 = 0x331 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002C3 /* UIKit.UITabBarDelegateWrapper */ },
		{ /* #410 = 0x333 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002C4 /* UIKit.UITabBarItem */ },
		{ /* #411 = 0x335 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002C6 /* UIKit.UITargetedPreview */ },
		{ /* #412 = 0x337 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002C5 /* UIKit.UITargetedDragPreview */ },
		{ /* #413 = 0x339 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002CD /* UIKit.IUITextDragDelegate */ },
		{ /* #414 = 0x33B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002CE /* UIKit.UITextDragDelegateWrapper */ },
		{ /* #415 = 0x33D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002D2 /* UIKit.IUITextDragRequest */ },
		{ /* #416 = 0x33F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002D3 /* UIKit.UITextDragRequestWrapper */ },
		{ /* #417 = 0x341 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002D4 /* UIKit.IUITextDropDelegate */ },
		{ /* #418 = 0x343 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002D5 /* UIKit.UITextDropDelegateWrapper */ },
		{ /* #419 = 0x345 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002D9 /* UIKit.UITextDropProposal */ },
		{ /* #420 = 0x347 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002DA /* UIKit.IUITextDropRequest */ },
		{ /* #421 = 0x349 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002DB /* UIKit.UITextDropRequestWrapper */ },
		{ /* #422 = 0x34B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002E1 /* UIKit.UITextFormattingViewController */ },
		{ /* #423 = 0x34D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002E2 /* UIKit.UITextFormattingViewControllerConfiguration */ },
		{ /* #424 = 0x34F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002E7 /* UIKit.UITextInputAssistantItem */ },
		{ /* #425 = 0x351 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002EA /* UIKit.UITextInputMode */ },
		{ /* #426 = 0x353 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002EB /* UIKit.UITextInputPasswordRules */ },
		{ /* #427 = 0x355 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002EC /* UIKit.IUITextInputTokenizer */ },
		{ /* #428 = 0x357 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002ED /* UIKit.UITextInputTokenizerWrapper */ },
		{ /* #429 = 0x359 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002F0 /* UIKit.UITextItem */ },
		{ /* #430 = 0x35B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002F2 /* UIKit.UITextItemMenuConfiguration */ },
		{ /* #431 = 0x35D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002F7 /* UIKit.IUITextPasteDelegate */ },
		{ /* #432 = 0x35F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002F8 /* UIKit.UITextPasteDelegateWrapper */ },
		{ /* #433 = 0x361 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002F9 /* UIKit.IUITextPasteItem */ },
		{ /* #434 = 0x363 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002FA /* UIKit.UITextPasteItemWrapper */ },
		{ /* #435 = 0x365 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002FB /* UIKit.UITextPlaceholder */ },
		{ /* #436 = 0x367 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002FC /* UIKit.UITextPosition */ },
		{ /* #437 = 0x369 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002FD /* UIKit.UITextRange */ },
		{ /* #438 = 0x36B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002FE /* UIKit.UITextSelectionRect */ },
		{ /* #439 = 0x36D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200030C /* UIKit.UIToolTipInteraction */ },
		{ /* #440 = 0x36F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200030D /* UIKit.UITouch */ },
		{ /* #441 = 0x371 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000311 /* UIKit.IUITraitDefinition */ },
		{ /* #442 = 0x373 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000312 /* UIKit.UITraitDefinitionWrapper */ },
		{ /* #443 = 0x375 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200031C /* UIKit.IUIViewControllerAnimatedTransitioning */ },
		{ /* #444 = 0x377 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200031D /* UIKit.UIViewControllerAnimatedTransitioningWrapper */ },
		{ /* #445 = 0x379 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200031E /* UIKit.IUIViewControllerContextTransitioning */ },
		{ /* #446 = 0x37B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200031F /* UIKit.UIViewControllerContextTransitioningWrapper */ },
		{ /* #447 = 0x37D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000320 /* UIKit.IUIViewControllerInteractiveTransitioning */ },
		{ /* #448 = 0x37F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000321 /* UIKit.UIViewControllerInteractiveTransitioningWrapper */ },
		{ /* #449 = 0x381 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000324 /* UIKit.IUIViewControllerTransitionCoordinatorContext */ },
		{ /* #450 = 0x383 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000325 /* UIKit.UIViewControllerTransitionCoordinatorContextWrapper */ },
		{ /* #451 = 0x385 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000322 /* UIKit.IUIViewControllerTransitionCoordinator */ },
		{ /* #452 = 0x387 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000323 /* UIKit.UIViewControllerTransitionCoordinatorWrapper */ },
		{ /* #453 = 0x389 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000327 /* UIKit.IUIViewImplicitlyAnimating */ },
		{ /* #454 = 0x38B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000328 /* UIKit.UIViewImplicitlyAnimatingWrapper */ },
		{ /* #455 = 0x38D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000329 /* UIKit.UIViewPrintFormatter */ },
		{ /* #456 = 0x38F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200032C /* UIKit.UIVisualEffectView */ },
		{ /* #457 = 0x391 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200032D /* UIKit.UIWebView */ },
		{ /* #458 = 0x393 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200032E /* UIKit.UIWindowSceneActivationConfiguration */ },
		{ /* #459 = 0x395 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000332 /* AVFoundation.AVPlayerLayer */ },
		{ /* #460 = 0x397 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000333 /* AVFoundation.AVPlayer */ },
		{ /* #461 = 0x399 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000339 /* AVFoundation.AVAudioSession */ },
		{ /* #462 = 0x39B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200033A /* AVFoundation.AVAsset */ },
		{ /* #463 = 0x39D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000341 /* AVFoundation.AVPlayerItemTrack */ },
		{ /* #464 = 0x39F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000343 /* AVFoundation.AVQueuePlayer */ },
		{ /* #465 = 0x3A1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200002C /* GLKit.GLKView/_GLKViewDelegate */ },
		{ /* #466 = 0x3A3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60001BD /* System.Void GLKit.GLKView/_GLKViewDelegate::DrawInRect(GLKit.GLKView,CoreGraphics.CGRect) */ },
		{ /* #467 = 0x3A5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000065 /* Foundation.NSData */ },
		{ /* #468 = 0x3A7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200006C /* Foundation.NSDictionary */ },
		{ /* #469 = 0x3A9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000079 /* Foundation.NSItemProvider */ },
		{ /* #470 = 0x3AB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200007D /* Foundation.NSMutableData */ },
		{ /* #471 = 0x3AD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000080 /* Foundation.NSMutableDictionary */ },
		{ /* #472 = 0x3AF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000087 /* Foundation.NSNotificationCenter */ },
		{ /* #473 = 0x3B1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000090 /* Foundation.NSObject/NSObject_Disposer */ },
		{ /* #474 = 0x3B3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000535 /* System.Void Foundation.NSObject/NSObject_Disposer::Drain(Foundation.NSObject) */ },
		{ /* #475 = 0x3B5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000532 /* System.Void Foundation.NSObject/NSObject_Disposer::.ctor() */ },
		{ /* #476 = 0x3B7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000A5 /* Foundation.NSUrlSessionConfiguration */ },
		{ /* #477 = 0x3B9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20000D2 /* Foundation.NSUrlSession */ },
		{ /* #478 = 0x3BB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200012E /* CoreAnimation.CAAnimation/_CAAnimationDelegate */ },
		{ /* #479 = 0x3BD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60008F7 /* System.Void CoreAnimation.CAAnimation/_CAAnimationDelegate::AnimationStarted(CoreAnimation.CAAnimation) */ },
		{ /* #480 = 0x3BF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60008F8 /* System.Void CoreAnimation.CAAnimation/_CAAnimationDelegate::AnimationStopped(CoreAnimation.CAAnimation,System.Boolean) */ },
		{ /* #481 = 0x3C1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60008F6 /* System.Void CoreAnimation.CAAnimation/_CAAnimationDelegate::.ctor() */ },
		{ /* #482 = 0x3C3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200014B /* System.Net.Http.NSUrlSessionHandler/WrappedNSInputStream */ },
		{ /* #483 = 0x3C5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60009E1 /* Foundation.NSStreamStatus System.Net.Http.NSUrlSessionHandler/WrappedNSInputStream::get_Status() */ },
		{ /* #484 = 0x3C7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60009E2 /* System.Void System.Net.Http.NSUrlSessionHandler/WrappedNSInputStream::Open() */ },
		{ /* #485 = 0x3C9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60009E3 /* System.Void System.Net.Http.NSUrlSessionHandler/WrappedNSInputStream::Close() */ },
		{ /* #486 = 0x3CB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60009E4 /* System.IntPtr System.Net.Http.NSUrlSessionHandler/WrappedNSInputStream::Read(System.IntPtr,System.UIntPtr) */ },
		{ /* #487 = 0x3CD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60009E5 /* Foundation.NSError System.Net.Http.NSUrlSessionHandler/WrappedNSInputStream::get_Error() */ },
		{ /* #488 = 0x3CF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60009E6 /* System.Boolean System.Net.Http.NSUrlSessionHandler/WrappedNSInputStream::HasBytesAvailable() */ },
		{ /* #489 = 0x3D1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60009E7 /* System.Boolean System.Net.Http.NSUrlSessionHandler/WrappedNSInputStream::GetBuffer(System.IntPtr&,System.UIntPtr&) */ },
		{ /* #490 = 0x3D3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60009E8 /* Foundation.NSObject System.Net.Http.NSUrlSessionHandler/WrappedNSInputStream::GetProperty(Foundation.NSString) */ },
		{ /* #491 = 0x3D5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60009E9 /* System.Boolean System.Net.Http.NSUrlSessionHandler/WrappedNSInputStream::SetProperty(Foundation.NSObject,Foundation.NSString) */ },
		{ /* #492 = 0x3D7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60009EA /* System.Boolean System.Net.Http.NSUrlSessionHandler/WrappedNSInputStream::SetCFClientFlags(CoreFoundation.CFStreamEventType,System.IntPtr,System.IntPtr) */ },
		{ /* #493 = 0x3D9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60009EB /* System.Void System.Net.Http.NSUrlSessionHandler/WrappedNSInputStream::Schedule(Foundation.NSRunLoop,Foundation.NSString) */ },
		{ /* #494 = 0x3DB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60009EC /* System.Void System.Net.Http.NSUrlSessionHandler/WrappedNSInputStream::Unschedule(Foundation.NSRunLoop,Foundation.NSString) */ },
		{ /* #495 = 0x3DD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000166 /* UIKit.UIActionSheet/_UIActionSheetDelegate */ },
		{ /* #496 = 0x3DF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000A79 /* System.Void UIKit.UIActionSheet/_UIActionSheetDelegate::Canceled(UIKit.UIActionSheet) */ },
		{ /* #497 = 0x3E1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000A7A /* System.Void UIKit.UIActionSheet/_UIActionSheetDelegate::Clicked(UIKit.UIActionSheet,System.IntPtr) */ },
		{ /* #498 = 0x3E3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000A7B /* System.Void UIKit.UIActionSheet/_UIActionSheetDelegate::Dismissed(UIKit.UIActionSheet,System.IntPtr) */ },
		{ /* #499 = 0x3E5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000A7C /* System.Void UIKit.UIActionSheet/_UIActionSheetDelegate::Presented(UIKit.UIActionSheet) */ },
		{ /* #500 = 0x3E7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000A7D /* System.Void UIKit.UIActionSheet/_UIActionSheetDelegate::WillDismiss(UIKit.UIActionSheet,System.IntPtr) */ },
		{ /* #501 = 0x3E9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000A7E /* System.Void UIKit.UIActionSheet/_UIActionSheetDelegate::WillPresent(UIKit.UIActionSheet) */ },
		{ /* #502 = 0x3EB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000165 /* UIKit.UIActionSheet */ },
		{ /* #503 = 0x3ED */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000169 /* UIKit.UIAlertView/_UIAlertViewDelegate */ },
		{ /* #504 = 0x3EF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000AA5 /* System.Void UIKit.UIAlertView/_UIAlertViewDelegate::Canceled(UIKit.UIAlertView) */ },
		{ /* #505 = 0x3F1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000AA6 /* System.Void UIKit.UIAlertView/_UIAlertViewDelegate::Clicked(UIKit.UIAlertView,System.IntPtr) */ },
		{ /* #506 = 0x3F3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000AA7 /* System.Void UIKit.UIAlertView/_UIAlertViewDelegate::Dismissed(UIKit.UIAlertView,System.IntPtr) */ },
		{ /* #507 = 0x3F5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000AA8 /* System.Void UIKit.UIAlertView/_UIAlertViewDelegate::Presented(UIKit.UIAlertView) */ },
		{ /* #508 = 0x3F7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000AA9 /* System.Boolean UIKit.UIAlertView/_UIAlertViewDelegate::ShouldEnableFirstOtherButton(UIKit.UIAlertView) */ },
		{ /* #509 = 0x3F9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000AAA /* System.Void UIKit.UIAlertView/_UIAlertViewDelegate::WillDismiss(UIKit.UIAlertView,System.IntPtr) */ },
		{ /* #510 = 0x3FB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000AAB /* System.Void UIKit.UIAlertView/_UIAlertViewDelegate::WillPresent(UIKit.UIAlertView) */ },
		{ /* #511 = 0x3FD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200016C /* UIKit.UIApplication */ },
		{ /* #512 = 0x3FF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000175 /* UIKit.UIBarButtonItem/Callback */ },
		{ /* #513 = 0x401 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000AFB /* System.Void UIKit.UIBarButtonItem/Callback::Call(Foundation.NSObject) */ },
		{ /* #514 = 0x403 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000AFA /* System.Void UIKit.UIBarButtonItem/Callback::.ctor() */ },
		{ /* #515 = 0x405 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000174 /* UIKit.UIBarButtonItem */ },
		{ /* #516 = 0x407 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001AD /* UIKit.UIView/UIViewAppearance */ },
		{ /* #517 = 0x409 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001055 /* System.Void UIKit.UIView/UIViewAppearance::set_BackgroundColor(UIKit.UIColor) */ },
		{ /* #518 = 0x40B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000180 /* UIKit.UIControl/UIControlAppearance */ },
		{ /* #519 = 0x40D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000188 /* UIKit.UIGestureRecognizer/Token */ },
		{ /* #520 = 0x40F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200019B /* UIKit.UIPopoverController/_UIPopoverControllerDelegate */ },
		{ /* #521 = 0x411 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000D17 /* System.Void UIKit.UIPopoverController/_UIPopoverControllerDelegate::DidDismiss(UIKit.UIPopoverController) */ },
		{ /* #522 = 0x413 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000D18 /* System.Boolean UIKit.UIPopoverController/_UIPopoverControllerDelegate::ShouldDismiss(UIKit.UIPopoverController) */ },
		{ /* #523 = 0x415 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000D19 /* System.Void UIKit.UIPopoverController/_UIPopoverControllerDelegate::WillReposition(UIKit.UIPopoverController,CoreGraphics.CGRect&,UIKit.UIView&) */ },
		{ /* #524 = 0x417 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000D16 /* System.Void UIKit.UIPopoverController/_UIPopoverControllerDelegate::.ctor() */ },
		{ /* #525 = 0x419 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200019A /* UIKit.UIPopoverController */ },
		{ /* #526 = 0x41B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001A0 /* UIKit.UISearchBar/_UISearchBarDelegate */ },
		{ /* #527 = 0x41D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000D96 /* System.Void UIKit.UISearchBar/_UISearchBarDelegate::BookmarkButtonClicked(UIKit.UISearchBar) */ },
		{ /* #528 = 0x41F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000D97 /* System.Void UIKit.UISearchBar/_UISearchBarDelegate::CancelButtonClicked(UIKit.UISearchBar) */ },
		{ /* #529 = 0x421 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000D98 /* System.Void UIKit.UISearchBar/_UISearchBarDelegate::ListButtonClicked(UIKit.UISearchBar) */ },
		{ /* #530 = 0x423 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000D99 /* System.Void UIKit.UISearchBar/_UISearchBarDelegate::OnEditingStarted(UIKit.UISearchBar) */ },
		{ /* #531 = 0x425 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000D9A /* System.Void UIKit.UISearchBar/_UISearchBarDelegate::OnEditingStopped(UIKit.UISearchBar) */ },
		{ /* #532 = 0x427 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000D9B /* System.Void UIKit.UISearchBar/_UISearchBarDelegate::SearchButtonClicked(UIKit.UISearchBar) */ },
		{ /* #533 = 0x429 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000D9C /* System.Void UIKit.UISearchBar/_UISearchBarDelegate::SelectedScopeButtonIndexChanged(UIKit.UISearchBar,System.IntPtr) */ },
		{ /* #534 = 0x42B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000D9D /* System.Boolean UIKit.UISearchBar/_UISearchBarDelegate::ShouldBeginEditing(UIKit.UISearchBar) */ },
		{ /* #535 = 0x42D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000D9E /* System.Boolean UIKit.UISearchBar/_UISearchBarDelegate::ShouldChangeTextInRange(UIKit.UISearchBar,Foundation.NSRange,System.String) */ },
		{ /* #536 = 0x42F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000D9F /* System.Boolean UIKit.UISearchBar/_UISearchBarDelegate::ShouldEndEditing(UIKit.UISearchBar) */ },
		{ /* #537 = 0x431 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000DA0 /* System.Void UIKit.UISearchBar/_UISearchBarDelegate::TextChanged(UIKit.UISearchBar,System.String) */ },
		{ /* #538 = 0x433 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000D95 /* System.Void UIKit.UISearchBar/_UISearchBarDelegate::.ctor() */ },
		{ /* #539 = 0x435 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001A7 /* UIKit.UITextField/_UITextFieldDelegate */ },
		{ /* #540 = 0x437 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000E79 /* System.Void UIKit.UITextField/_UITextFieldDelegate::EditingEnded(UIKit.UITextField) */ },
		{ /* #541 = 0x439 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000E7A /* System.Void UIKit.UITextField/_UITextFieldDelegate::EditingEnded(UIKit.UITextField,UIKit.UITextFieldDidEndEditingReason) */ },
		{ /* #542 = 0x43B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000E7B /* System.Void UIKit.UITextField/_UITextFieldDelegate::EditingStarted(UIKit.UITextField) */ },
		{ /* #543 = 0x43D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000E7C /* System.Boolean UIKit.UITextField/_UITextFieldDelegate::ShouldBeginEditing(UIKit.UITextField) */ },
		{ /* #544 = 0x43F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000E7D /* System.Boolean UIKit.UITextField/_UITextFieldDelegate::ShouldChangeCharacters(UIKit.UITextField,Foundation.NSRange,System.String) */ },
		{ /* #545 = 0x441 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000E7E /* System.Boolean UIKit.UITextField/_UITextFieldDelegate::ShouldClear(UIKit.UITextField) */ },
		{ /* #546 = 0x443 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000E7F /* System.Boolean UIKit.UITextField/_UITextFieldDelegate::ShouldEndEditing(UIKit.UITextField) */ },
		{ /* #547 = 0x445 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000E80 /* System.Boolean UIKit.UITextField/_UITextFieldDelegate::ShouldReturn(UIKit.UITextField) */ },
		{ /* #548 = 0x447 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000E78 /* System.Void UIKit.UITextField/_UITextFieldDelegate::.ctor() */ },
		{ /* #549 = 0x449 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002A0 /* UIKit.UIScrollView/_UIScrollViewDelegate */ },
		{ /* #550 = 0x44B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x600156C /* System.Void UIKit.UIScrollView/_UIScrollViewDelegate::DecelerationEnded(UIKit.UIScrollView) */ },
		{ /* #551 = 0x44D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x600156D /* System.Void UIKit.UIScrollView/_UIScrollViewDelegate::DecelerationStarted(UIKit.UIScrollView) */ },
		{ /* #552 = 0x44F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x600156E /* System.Void UIKit.UIScrollView/_UIScrollViewDelegate::DidChangeAdjustedContentInset(UIKit.UIScrollView) */ },
		{ /* #553 = 0x451 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x600156F /* System.Void UIKit.UIScrollView/_UIScrollViewDelegate::DidZoom(UIKit.UIScrollView) */ },
		{ /* #554 = 0x453 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001570 /* System.Void UIKit.UIScrollView/_UIScrollViewDelegate::DraggingEnded(UIKit.UIScrollView,System.Boolean) */ },
		{ /* #555 = 0x455 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001571 /* System.Void UIKit.UIScrollView/_UIScrollViewDelegate::DraggingStarted(UIKit.UIScrollView) */ },
		{ /* #556 = 0x457 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001572 /* System.Void UIKit.UIScrollView/_UIScrollViewDelegate::ScrollAnimationEnded(UIKit.UIScrollView) */ },
		{ /* #557 = 0x459 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001573 /* System.Void UIKit.UIScrollView/_UIScrollViewDelegate::Scrolled(UIKit.UIScrollView) */ },
		{ /* #558 = 0x45B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001574 /* System.Void UIKit.UIScrollView/_UIScrollViewDelegate::ScrolledToTop(UIKit.UIScrollView) */ },
		{ /* #559 = 0x45D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001575 /* System.Boolean UIKit.UIScrollView/_UIScrollViewDelegate::ShouldScrollToTop(UIKit.UIScrollView) */ },
		{ /* #560 = 0x45F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001576 /* UIKit.UIView UIKit.UIScrollView/_UIScrollViewDelegate::ViewForZoomingInScrollView(UIKit.UIScrollView) */ },
		{ /* #561 = 0x461 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001577 /* System.Void UIKit.UIScrollView/_UIScrollViewDelegate::WillEndDragging(UIKit.UIScrollView,CoreGraphics.CGPoint,CoreGraphics.CGPoint&) */ },
		{ /* #562 = 0x463 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001578 /* System.Void UIKit.UIScrollView/_UIScrollViewDelegate::ZoomingEnded(UIKit.UIScrollView,UIKit.UIView,System.Runtime.InteropServices.NFloat) */ },
		{ /* #563 = 0x465 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001579 /* System.Void UIKit.UIScrollView/_UIScrollViewDelegate::ZoomingStarted(UIKit.UIScrollView,UIKit.UIView) */ },
		{ /* #564 = 0x467 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x600156B /* System.Void UIKit.UIScrollView/_UIScrollViewDelegate::.ctor() */ },
		{ /* #565 = 0x469 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20001A9 /* UIKit.UITextView/_UITextViewDelegate */ },
		{ /* #566 = 0x46B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F4B /* System.Void UIKit.UITextView/_UITextViewDelegate::Changed(UIKit.UITextView) */ },
		{ /* #567 = 0x46D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F4C /* System.Void UIKit.UITextView/_UITextViewDelegate::DidBeginFormatting(UIKit.UITextView,UIKit.UITextFormattingViewController) */ },
		{ /* #568 = 0x46F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F4D /* System.Void UIKit.UITextView/_UITextViewDelegate::DidEndFormatting(UIKit.UITextView,UIKit.UITextFormattingViewController) */ },
		{ /* #569 = 0x471 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F4E /* System.Void UIKit.UITextView/_UITextViewDelegate::EditingEnded(UIKit.UITextView) */ },
		{ /* #570 = 0x473 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F4F /* System.Void UIKit.UITextView/_UITextViewDelegate::EditingStarted(UIKit.UITextView) */ },
		{ /* #571 = 0x475 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F50 /* Foundation.NSValue[] UIKit.UITextView/_UITextViewDelegate::GetWritingToolsIgnoredRangesInEnclosingRange(UIKit.UITextView,Foundation.NSRange) */ },
		{ /* #572 = 0x477 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F51 /* System.Void UIKit.UITextView/_UITextViewDelegate::SelectionChanged(UIKit.UITextView) */ },
		{ /* #573 = 0x479 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F52 /* System.Boolean UIKit.UITextView/_UITextViewDelegate::ShouldBeginEditing(UIKit.UITextView) */ },
		{ /* #574 = 0x47B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F53 /* System.Boolean UIKit.UITextView/_UITextViewDelegate::ShouldChangeText(UIKit.UITextView,Foundation.NSRange,System.String) */ },
		{ /* #575 = 0x47D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F54 /* System.Boolean UIKit.UITextView/_UITextViewDelegate::ShouldEndEditing(UIKit.UITextView) */ },
		{ /* #576 = 0x47F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F55 /* System.Boolean UIKit.UITextView/_UITextViewDelegate::ShouldInteractWithTextAttachment(UIKit.UITextView,UIKit.NSTextAttachment,Foundation.NSRange) */ },
		{ /* #577 = 0x481 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F56 /* System.Boolean UIKit.UITextView/_UITextViewDelegate::ShouldInteractWithTextAttachment(UIKit.UITextView,UIKit.NSTextAttachment,Foundation.NSRange,UIKit.UITextItemInteraction) */ },
		{ /* #578 = 0x483 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F57 /* System.Boolean UIKit.UITextView/_UITextViewDelegate::ShouldInteractWithUrl(UIKit.UITextView,Foundation.NSUrl,Foundation.NSRange) */ },
		{ /* #579 = 0x485 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F58 /* System.Boolean UIKit.UITextView/_UITextViewDelegate::ShouldInteractWithUrl(UIKit.UITextView,Foundation.NSUrl,Foundation.NSRange,UIKit.UITextItemInteraction) */ },
		{ /* #580 = 0x487 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F59 /* System.Void UIKit.UITextView/_UITextViewDelegate::WillBeginFormatting(UIKit.UITextView,UIKit.UITextFormattingViewController) */ },
		{ /* #581 = 0x489 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F5A /* System.Void UIKit.UITextView/_UITextViewDelegate::WillEndFormatting(UIKit.UITextView,UIKit.UITextFormattingViewController) */ },
		{ /* #582 = 0x48B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F5B /* System.Void UIKit.UITextView/_UITextViewDelegate::WritingToolsDidEnd(UIKit.UITextView) */ },
		{ /* #583 = 0x48D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F5C /* System.Void UIKit.UITextView/_UITextViewDelegate::WritingToolsWillBegin(UIKit.UITextView) */ },
		{ /* #584 = 0x48F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F5D /* System.Boolean UIKit.UITextView/_UITextViewDelegate::RespondsToSelector(ObjCRuntime.Selector) */ },
		{ /* #585 = 0x491 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6000F4A /* System.Void UIKit.UITextView/_UITextViewDelegate::.ctor() */ },
		{ /* #586 = 0x493 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200022E /* UIKit.UIDatePicker/UIDatePickerAppearance */ },
		{ /* #587 = 0x495 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200022D /* UIKit.UIDatePicker */ },
		{ /* #588 = 0x497 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002BE /* UIKit.UITabBar/_UITabBarDelegate */ },
		{ /* #589 = 0x499 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001644 /* System.Void UIKit.UITabBar/_UITabBarDelegate::DidBeginCustomizingItems(UIKit.UITabBar,UIKit.UITabBarItem[]) */ },
		{ /* #590 = 0x49B */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001645 /* System.Void UIKit.UITabBar/_UITabBarDelegate::DidEndCustomizingItems(UIKit.UITabBar,UIKit.UITabBarItem[],System.Boolean) */ },
		{ /* #591 = 0x49D */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001646 /* System.Void UIKit.UITabBar/_UITabBarDelegate::ItemSelected(UIKit.UITabBar,UIKit.UITabBarItem) */ },
		{ /* #592 = 0x49F */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001647 /* System.Void UIKit.UITabBar/_UITabBarDelegate::WillBeginCustomizingItems(UIKit.UITabBar,UIKit.UITabBarItem[]) */ },
		{ /* #593 = 0x4A1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001648 /* System.Void UIKit.UITabBar/_UITabBarDelegate::WillEndCustomizingItems(UIKit.UITabBar,UIKit.UITabBarItem[],System.Boolean) */ },
		{ /* #594 = 0x4A3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001643 /* System.Void UIKit.UITabBar/_UITabBarDelegate::.ctor() */ },
		{ /* #595 = 0x4A5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x20002BD /* UIKit.UITabBar */ },
		{ /* #596 = 0x4A7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000334 /* AVFoundation.AVPlayerItem */ },
		{ /* #597 = 0x4A9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200033B /* AVFoundation.AVAssetTrack */ },
		{ /* #598 = 0x4AB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000143 /* System.Net.Http.NSUrlSessionHandler/NSUrlSessionHandlerDelegate */ },
		{ /* #599 = 0x4AD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x600099E /* System.Void System.Net.Http.NSUrlSessionHandler/NSUrlSessionHandlerDelegate::DidReceiveResponse(Foundation.NSUrlSession,Foundation.NSUrlSessionDataTask,Foundation.NSUrlResponse,System.Action`1<Foundation.NSUrlSessionResponseDisposition>) */ },
		{ /* #600 = 0x4AF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001D41 /* System.Action`1<Foundation.NSUrlSessionResponseDisposition> ObjCRuntime.Trampolines/NIDActionArity1V67::Create(System.IntPtr) */ },
		{ /* #601 = 0x4B1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60009A0 /* System.Void System.Net.Http.NSUrlSessionHandler/NSUrlSessionHandlerDelegate::DidReceiveData(Foundation.NSUrlSession,Foundation.NSUrlSessionDataTask,Foundation.NSData) */ },
		{ /* #602 = 0x4B3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60009A1 /* System.Void System.Net.Http.NSUrlSessionHandler/NSUrlSessionHandlerDelegate::DidCompleteWithError(Foundation.NSUrlSession,Foundation.NSUrlSessionTask,Foundation.NSError) */ },
		{ /* #603 = 0x4B5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60009A3 /* System.Void System.Net.Http.NSUrlSessionHandler/NSUrlSessionHandlerDelegate::WillCacheResponse(Foundation.NSUrlSession,Foundation.NSUrlSessionDataTask,Foundation.NSCachedUrlResponse,System.Action`1<Foundation.NSCachedUrlResponse>) */ },
		{ /* #604 = 0x4B7 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001D29 /* System.Action`1<Foundation.NSCachedUrlResponse> ObjCRuntime.Trampolines/NIDActionArity1V65::Create(System.IntPtr) */ },
		{ /* #605 = 0x4B9 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60009A5 /* System.Void System.Net.Http.NSUrlSessionHandler/NSUrlSessionHandlerDelegate::WillPerformHttpRedirection(Foundation.NSUrlSession,Foundation.NSUrlSessionTask,Foundation.NSHttpUrlResponse,Foundation.NSUrlRequest,System.Action`1<Foundation.NSUrlRequest>) */ },
		{ /* #606 = 0x4BB */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001D3C /* System.Action`1<Foundation.NSUrlRequest> ObjCRuntime.Trampolines/NIDActionArity1V3::Create(System.IntPtr) */ },
		{ /* #607 = 0x4BD */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x60009A6 /* System.Void System.Net.Http.NSUrlSessionHandler/NSUrlSessionHandlerDelegate::DidReceiveChallenge(Foundation.NSUrlSession,Foundation.NSUrlSessionTask,Foundation.NSUrlAuthenticationChallenge,System.Action`2<Foundation.NSUrlSessionAuthChallengeDisposition,Foundation.NSUrlCredential>) */ },
		{ /* #608 = 0x4BF */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x6001D9E /* System.Action`2<Foundation.NSUrlSessionAuthChallengeDisposition,Foundation.NSUrlCredential> ObjCRuntime.Trampolines/NIDActionArity2V11::Create(System.IntPtr) */ },
		{ /* #609 = 0x4C1 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x2000083 /* Foundation.NSMutableSet`1 */ },
		{ /* #610 = 0x4C3 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200009B /* Foundation.NSSet`1 */ },
		{ /* #611 = 0x4C5 */ 148 /* Microsoft.iOS */, 0x1 /* Microsoft.iOS.dll */, 0x200006E /* Foundation.NSDictionary`2 */ },

	};

	static const MTProtocolWrapperMap __xamarin_protocol_wrapper_map [] = {
		{ 0x7 /* UIKit.IUIPasteConfigurationSupporting */, 0x9 /* UIPasteConfigurationSupportingWrapper */ },
		{ 0xD /* UIKit.IUICoordinateSpace */, 0xF /* UICoordinateSpaceWrapper */ },
		{ 0x11 /* UIKit.IUIFocusEnvironment */, 0x13 /* UIFocusEnvironmentWrapper */ },
		{ 0x15 /* UIKit.IUIFocusItem */, 0x17 /* UIFocusItemWrapper */ },
		{ 0x19 /* UIKit.IUIFocusItemContainer */, 0x1B /* UIFocusItemContainerWrapper */ },
		{ 0x25 /* GLKit.IGLKViewDelegate */, 0x27 /* GLKViewDelegateWrapper */ },
		{ 0x29 /* UIKit.IUIScrollViewDelegate */, 0x2B /* UIScrollViewDelegateWrapper */ },
		{ 0x35 /* UIKit.IUINavigationControllerDelegate */, 0x37 /* UINavigationControllerDelegateWrapper */ },
		{ 0x3D /* UIKit.IUICollectionViewDataSource */, 0x3F /* UICollectionViewDataSourceWrapper */ },
		{ 0x41 /* UIKit.IUICollectionViewDelegate */, 0x43 /* UICollectionViewDelegateWrapper */ },
		{ 0x55 /* UIKit.IUIPickerViewDataSource */, 0x57 /* UIPickerViewDataSourceWrapper */ },
		{ 0x59 /* UIKit.IUIPickerViewDelegate */, 0x5B /* UIPickerViewDelegateWrapper */ },
		{ 0x61 /* UIKit.IUITextViewDelegate */, 0x63 /* UITextViewDelegateWrapper */ },
		{ 0x69 /* WebKit.IWKUIDelegate */, 0x6B /* WKUIDelegateWrapper */ },
		{ 0x79 /* WebKit.IWKScriptMessageHandler */, 0x7B /* WKScriptMessageHandlerWrapper */ },
		{ 0x8F /* UIKit.IUITextInputTraits */, 0x91 /* UITextInputTraitsWrapper */ },
		{ 0x93 /* UIKit.IUIKeyInput */, 0x95 /* UIKeyInputWrapper */ },
		{ 0x97 /* UIKit.IUITextInput */, 0x99 /* UITextInputWrapper */ },
		{ 0x9B /* UIKit.IUITextDraggable */, 0x9D /* UITextDraggableWrapper */ },
		{ 0x9F /* UIKit.IUITextPasteConfigurationSupporting */, 0xA1 /* UITextPasteConfigurationSupportingWrapper */ },
		{ 0xA3 /* UIKit.IUITextDroppable */, 0xA5 /* UITextDroppableWrapper */ },
		{ 0xA9 /* UIKit.IUITextFieldDelegate */, 0xAB /* UITextFieldDelegateWrapper */ },
		{ 0xB3 /* WebKit.IWKNavigationDelegate */, 0xB5 /* WKNavigationDelegateWrapper */ },
		{ 0xD3 /* CallKit.ICXCallObserverDelegate */, 0xD5 /* CXCallObserverDelegateWrapper */ },
		{ 0xDB /* AuthenticationServices.IASWebAuthenticationPresentationContextProviding */, 0xDD /* ASWebAuthenticationPresentationContextProvidingWrapper */ },
		{ 0xE9 /* CoreLocation.ICLLocationManagerDelegate */, 0xEB /* CLLocationManagerDelegateWrapper */ },
		{ 0x119 /* Foundation.INSCopying */, 0x11B /* NSCopyingWrapper */ },
		{ 0x125 /* WebKit.IWKPreviewActionItem */, 0x127 /* WKPreviewActionItemWrapper */ },
		{ 0x153 /* Foundation.INSMutableCopying */, 0x155 /* NSMutableCopyingWrapper */ },
		{ 0x159 /* Foundation.INSItemProviderReading */, 0x15B /* NSItemProviderReadingWrapper */ },
		{ 0x1BF /* Foundation.INSUrlSessionDelegate */, 0x1C1 /* NSUrlSessionDelegateWrapper */ },
		{ 0x1F1 /* CoreAnimation.ICAAnimationDelegate */, 0x1F3 /* CAAnimationDelegateWrapper */ },
		{ 0x239 /* UIKit.IUITraitOverrides */, 0x23B /* UITraitOverridesWrapper */ },
		{ 0x257 /* UIKit.IUIActionSheetDelegate */, 0x259 /* UIActionSheetDelegateWrapper */ },
		{ 0x25D /* UIKit.IUIActivityItemsConfigurationReading */, 0x25F /* UIActivityItemsConfigurationReadingWrapper */ },
		{ 0x267 /* UIKit.IUIAlertViewDelegate */, 0x269 /* UIAlertViewDelegateWrapper */ },
		{ 0x27B /* UIKit.IUICollectionViewDataSourcePrefetching */, 0x27D /* UICollectionViewDataSourcePrefetchingWrapper */ },
		{ 0x27F /* UIKit.IUICollectionViewDragDelegate */, 0x281 /* UICollectionViewDragDelegateWrapper */ },
		{ 0x283 /* UIKit.IUICollectionViewDropCoordinator */, 0x285 /* UICollectionViewDropCoordinatorWrapper */ },
		{ 0x287 /* UIKit.IUICollectionViewDropDelegate */, 0x289 /* UICollectionViewDropDelegateWrapper */ },
		{ 0x28B /* UIKit.IUICollectionViewDropItem */, 0x28D /* UICollectionViewDropItemWrapper */ },
		{ 0x293 /* UIKit.IUIDragAnimating */, 0x295 /* UIDragAnimatingWrapper */ },
		{ 0x297 /* UIKit.IUICollectionViewDropPlaceholderContext */, 0x299 /* UICollectionViewDropPlaceholderContextWrapper */ },
		{ 0x2AD /* UIKit.IUIInteraction */, 0x2AF /* UIInteractionWrapper */ },
		{ 0x2B3 /* UIKit.IUIContextMenuInteractionAnimating */, 0x2B5 /* UIContextMenuInteractionAnimatingWrapper */ },
		{ 0x2B7 /* UIKit.IUIContextMenuInteractionCommitAnimating */, 0x2B9 /* UIContextMenuInteractionCommitAnimatingWrapper */ },
		{ 0x2BB /* UIKit.IUITimingCurveProvider */, 0x2BD /* UITimingCurveProviderWrapper */ },
		{ 0x2D1 /* UIKit.IUIDragSession */, 0x2D3 /* UIDragSessionWrapper */ },
		{ 0x2D7 /* UIKit.IUIDropSession */, 0x2D9 /* UIDropSessionWrapper */ },
		{ 0x2DB /* UIKit.IUIEditMenuInteractionAnimating */, 0x2DD /* UIEditMenuInteractionAnimatingWrapper */ },
		{ 0x2F1 /* UIKit.IUITextInputDelegate */, 0x2F3 /* UITextInputDelegateWrapper */ },
		{ 0x307 /* UIKit.IUINavigationBarDelegate */, 0x309 /* UINavigationBarDelegateWrapper */ },
		{ 0x315 /* UIKit.IUIPopoverControllerDelegate */, 0x317 /* UIPopoverControllerDelegateWrapper */ },
		{ 0x31F /* UIKit.IUISearchBarDelegate */, 0x321 /* UISearchBarDelegateWrapper */ },
		{ 0x325 /* UIKit.IUISpringLoadedInteractionContext */, 0x327 /* UISpringLoadedInteractionContextWrapper */ },
		{ 0x32F /* UIKit.IUITabBarDelegate */, 0x331 /* UITabBarDelegateWrapper */ },
		{ 0x339 /* UIKit.IUITextDragDelegate */, 0x33B /* UITextDragDelegateWrapper */ },
		{ 0x33D /* UIKit.IUITextDragRequest */, 0x33F /* UITextDragRequestWrapper */ },
		{ 0x341 /* UIKit.IUITextDropDelegate */, 0x343 /* UITextDropDelegateWrapper */ },
		{ 0x347 /* UIKit.IUITextDropRequest */, 0x349 /* UITextDropRequestWrapper */ },
		{ 0x355 /* UIKit.IUITextInputTokenizer */, 0x357 /* UITextInputTokenizerWrapper */ },
		{ 0x35D /* UIKit.IUITextPasteDelegate */, 0x35F /* UITextPasteDelegateWrapper */ },
		{ 0x361 /* UIKit.IUITextPasteItem */, 0x363 /* UITextPasteItemWrapper */ },
		{ 0x371 /* UIKit.IUITraitDefinition */, 0x373 /* UITraitDefinitionWrapper */ },
		{ 0x375 /* UIKit.IUIViewControllerAnimatedTransitioning */, 0x377 /* UIViewControllerAnimatedTransitioningWrapper */ },
		{ 0x379 /* UIKit.IUIViewControllerContextTransitioning */, 0x37B /* UIViewControllerContextTransitioningWrapper */ },
		{ 0x37D /* UIKit.IUIViewControllerInteractiveTransitioning */, 0x37F /* UIViewControllerInteractiveTransitioningWrapper */ },
		{ 0x381 /* UIKit.IUIViewControllerTransitionCoordinatorContext */, 0x383 /* UIViewControllerTransitionCoordinatorContextWrapper */ },
		{ 0x385 /* UIKit.IUIViewControllerTransitionCoordinator */, 0x387 /* UIViewControllerTransitionCoordinatorWrapper */ },
		{ 0x389 /* UIKit.IUIViewImplicitlyAnimating */, 0x38B /* UIViewImplicitlyAnimatingWrapper */ },
	};

	static struct MTRegistrationMap __xamarin_registration_map = {
		"8354d6d971c635925ef7b26da8b04305b5b3035a",
		__xamarin_registration_assemblies,
		__xamarin_class_map,
		__xamarin_token_references,
		__xamarin_skipped_map,
		__xamarin_protocol_wrapper_map,
		{ NULL, NULL },
		149,
		693,
		611,
		3,
		70,
		0,
		(void **)0
	};

void xamarin_create_classes () {
	__xamarin_class_map [0].handle = objc_getClass ("NSObject");
	__xamarin_class_map [1].handle = objc_getClass ("Microsoft_iOS__UIKit_UIApplicationDelegate");
	__xamarin_class_map [2].handle = [Microsoft_Maui_MauiUIApplicationDelegate class];
	__xamarin_class_map [3].handle = [__UnoHotRestartDelegate class];
	__xamarin_class_map [4].handle = objc_getClass ("UIResponder");
	__xamarin_class_map [5].handle = objc_getClass ("UIView");
	__xamarin_class_map [6].handle = [Uno_UI_Controls_BindableUIView class];
	__xamarin_class_map [7].handle = [Microsoft_UI_Xaml_UIElement class];
	__xamarin_class_map [8].handle = [Microsoft_UI_Xaml_FrameworkElement class];
	__xamarin_class_map [9].handle = [Microsoft_UI_Xaml_Controls_Control class];
	__xamarin_class_map [10].handle = [Microsoft_UI_Xaml_Controls_ContentControl class];
	__xamarin_class_map [11].handle = [Microsoft_UI_Xaml_Controls_UserControl class];
	__xamarin_class_map [12].handle = [Microsoft_UI_Xaml_Controls_Page class];
	__xamarin_class_map [13].handle = [Unoapp1_SplashScreen class];
	__xamarin_class_map [14].handle = [UnoAppDelegate class];
	__xamarin_class_map [15].handle = [UnoApp1_App class];
	__xamarin_class_map [16].handle = [UnoApp1_Pages_Registration_RegisterHomePage class];
	__xamarin_class_map [17].handle = [UnoApp1_Pages_Control_HomeControlPage class];
	__xamarin_class_map [18].handle = [UnoApp1_Pages_Authentication_EmailConfirmationPage class];
	__xamarin_class_map [19].handle = [UnoApp1_Pages_Authentication_LoginPage class];
	__xamarin_class_map [20].handle = [UnoApp1_Pages_Authentication_SignUpPage class];
	__xamarin_class_map [21].handle = [SkiaSharp_Views_Windows_SKSwapChainPanel class];
	__xamarin_class_map [22].handle = [Microsoft_UI_Xaml_Controls_Panel class];
	__xamarin_class_map [23].handle = [Microsoft_UI_Xaml_Controls_Canvas class];
	__xamarin_class_map [24].handle = [SkiaSharp_Views_Windows_SKXamlCanvas class];
	__xamarin_class_map [25].handle = objc_getClass ("GLKView");
	__xamarin_class_map [26].handle = [SkiaSharp_Views_Windows_SKGLView class];
	__xamarin_class_map [27].handle = [Uno_Material_Ripple class];
	__xamarin_class_map [28].handle = objc_getClass ("Microsoft_iOS__UIKit_UIScrollViewDelegate");
	__xamarin_class_map [29].handle = [Uno_Toolkit_UI_ScrollViewDelegate class];
	__xamarin_class_map [30].handle = [Uno_Toolkit_UI_CardContentControl class];
	__xamarin_class_map [31].handle = [Uno_Toolkit_UI_Card class];
	__xamarin_class_map [32].handle = [Microsoft_UI_Xaml_Controls_Primitives_ButtonBase class];
	__xamarin_class_map [33].handle = [Microsoft_UI_Xaml_Controls_Primitives_ToggleButton class];
	__xamarin_class_map [34].handle = [Uno_Toolkit_UI_Chip class];
	__xamarin_class_map [35].handle = [Uno_Toolkit_UI_Divider class];
	__xamarin_class_map [36].handle = [Uno_Toolkit_UI_DrawerControl class];
	__xamarin_class_map [37].handle = [Microsoft_UI_Xaml_Controls_Border class];
	__xamarin_class_map [38].handle = [Uno_Toolkit_UI_AppBarButtonWrapper class];
	__xamarin_class_map [39].handle = [Uno_Toolkit_UI_TitleView class];
	__xamarin_class_map [40].handle = [Uno_Toolkit_UI_SafeAreaPresenter class];
	__xamarin_class_map [41].handle = [Microsoft_UI_Xaml_Controls_Primitives_SelectorItem class];
	__xamarin_class_map [42].handle = [Uno_Toolkit_UI_TabBarItem class];
	__xamarin_class_map [43].handle = [Microsoft_UI_Xaml_Controls_RelativePanel class];
	__xamarin_class_map [44].handle = [Uno_Toolkit_UI_AutoLayout class];
	__xamarin_class_map [45].handle = [Microsoft_UI_Xaml_Controls_ItemsControl class];
	__xamarin_class_map [46].handle = [Uno_Toolkit_UI_ChipGroup class];
	__xamarin_class_map [47].handle = [Uno_Toolkit_UI_DrawerFlyoutPresenter class];
	__xamarin_class_map [48].handle = [Uno_Toolkit_UI_LoadingView class];
	__xamarin_class_map [49].handle = [Uno_Toolkit_UI_ExtendedSplashScreen class];
	__xamarin_class_map [50].handle = [Uno_Toolkit_UI_CompositeLoadableSource class];
	__xamarin_class_map [51].handle = [Uno_Toolkit_UI_LoadableSource class];
	__xamarin_class_map [52].handle = objc_getClass ("UIViewController");
	__xamarin_class_map [53].handle = [Uno_Toolkit_UI_NativeFramePresenter_PageViewController class];
	__xamarin_class_map [54].handle = objc_getClass ("UINavigationController");
	__xamarin_class_map [55].handle = [Uno_Toolkit_UI_NativeFramePresenter_FrameNavigationController class];
	__xamarin_class_map [56].handle = objc_getClass ("Microsoft_iOS__UIKit_UINavigationControllerDelegate");
	__xamarin_class_map [57].handle = [Uno_Toolkit_UI_NativeFramePresenter_ControllerDelegate class];
	__xamarin_class_map [58].handle = [Uno_Toolkit_UI_NativeFramePresenter class];
	__xamarin_class_map [59].handle = [Microsoft_UI_Xaml_Controls_ContentPresenter class];
	__xamarin_class_map [60].handle = [Uno_Toolkit_UI_NativeNavigationBarPresenter class];
	__xamarin_class_map [61].handle = [Uno_Toolkit_UI_NavigationBar class];
	__xamarin_class_map [62].handle = [Uno_Toolkit_UI_NavigationBarPresenter class];
	__xamarin_class_map [63].handle = [Uno_Toolkit_UI_ResponsiveView class];
	__xamarin_class_map [64].handle = [Uno_Toolkit_UI_SafeArea class];
	__xamarin_class_map [65].handle = [Uno_Toolkit_UI_TabBar class];
	__xamarin_class_map [66].handle = [Uno_Toolkit_UI_TabBarListPanel class];
	__xamarin_class_map [67].handle = [Uno_Toolkit_UI_TabBarSelectionIndicatorPresenter class];
	__xamarin_class_map [68].handle = [Uno_UI_HotDesign_BaseToolWindowControl class];
	__xamarin_class_map [69].handle = [Uno_UI_HotDesign_Controls_ShadowControl class];
	__xamarin_class_map [70].handle = [Uno_UI_HotDesign_Client_Core_Controls_DataTemplateBreadcrumb class];
	__xamarin_class_map [71].handle = [Uno_UI_HotDesign_Client_Controls_HDMessage class];
	__xamarin_class_map [72].handle = [Uno_UI_HotDesign_Client_Controls_ShellControlPanel class];
	__xamarin_class_map [73].handle = [Uno_UI_HotDesign_Client_Controls_ShellToolbarMenu class];
	__xamarin_class_map [74].handle = [Uno_UI_HotDesign_Client_HotDesignClientHost class];
	__xamarin_class_map [75].handle = [Uno_UI_HotDesign_Client_HotReload_HotReloadStatusView class];
	__xamarin_class_map [76].handle = [Uno_UI_HotDesign_Client_Controls_Adornment class];
	__xamarin_class_map [77].handle = [Uno_UI_HotDesign_Client_Controls_DataTemplateEditor class];
	__xamarin_class_map [78].handle = [Uno_UI_HotDesign_Client_Controls_DesignerOverlay class];
	__xamarin_class_map [79].handle = [Uno_UI_HotDesign_Client_Controls_EntryButton class];
	__xamarin_class_map [80].handle = [Uno_UI_HotDesign_Client_Controls_ZoomContentControl class];
	__xamarin_class_map [81].handle = [Uno_UI_HotDesign_Client_Adorners_AdornersLayer class];
	__xamarin_class_map [82].handle = [Uno_UI_HotDesign_CommunityToolkit_Controls_SizerBase class];
	__xamarin_class_map [83].handle = [Microsoft_UI_Xaml_Controls_Grid class];
	__xamarin_class_map [84].handle = [Uno_UI_HotDesign_CommunityToolkit_Controls_UniformGrid class];
	__xamarin_class_map [85].handle = [Uno_UI_HotDesign_CommunityToolkit_Controls_GridSplitter class];
	__xamarin_class_map [86].handle = [Uno_UI_HotDesign_Hierarchy_HierarchyView class];
	__xamarin_class_map [87].handle = [Uno_UI_HotDesign_PropertyGrid_PropertySearchBar class];
	__xamarin_class_map [88].handle = [Uno_UI_HotDesign_PropertyGrid_SelectionBreadcrumb class];
	__xamarin_class_map [89].handle = [Uno_UI_HotDesign_PropertyGrid_AdvancedPropertyEditor class];
	__xamarin_class_map [90].handle = [Uno_UI_HotDesign_PropertyGrid_CollectionEditor class];
	__xamarin_class_map [91].handle = [Uno_UI_HotDesign_PropertyGrid_IdentityProperties class];
	__xamarin_class_map [92].handle = [Uno_UI_HotDesign_PropertyGrid_SelectionProperties class];
	__xamarin_class_map [93].handle = [Microsoft_UI_Xaml_Controls_ContentDialog class];
	__xamarin_class_map [94].handle = [Uno_UI_HotDesign_PropertyGrid_PropertyFlyout class];
	__xamarin_class_map [95].handle = [Uno_UI_HotDesign_PropertyGrid_PropertyGridCell class];
	__xamarin_class_map [96].handle = [Uno_UI_HotDesign_PropertyGrid_PropertyGridView class];
	__xamarin_class_map [97].handle = [Uno_UI_HotDesign_PropertyGrid_Editors_CornerRadiusEditor class];
	__xamarin_class_map [98].handle = [Uno_UI_HotDesign_PropertyGrid_Editors_GridDefinitionsEditor class];
	__xamarin_class_map [99].handle = [Uno_UI_HotDesign_Toolbox_ToolboxView class];
	__xamarin_class_map [100].handle = [Uno_UI_Toolkit_ElevatedView class];
	__xamarin_class_map [101].handle = [Uno_Diagnostics_UI_DiagnosticsOverlay class];
	__xamarin_class_map [102].handle = [Microsoft_UI_Xaml_DragRoot class];
	__xamarin_class_map [103].handle = [Microsoft_UI_Xaml_DragView class];
	__xamarin_class_map [104].handle = [Microsoft_UI_Xaml_Shapes_Shape class];
	__xamarin_class_map [105].handle = [Microsoft_UI_Xaml_Shapes_Ellipse class];
	__xamarin_class_map [106].handle = [Microsoft_UI_Xaml_Shapes_Line class];
	__xamarin_class_map [107].handle = [Microsoft_UI_Xaml_Shapes_Path class];
	__xamarin_class_map [108].handle = [Microsoft_UI_Xaml_Shapes_Rectangle class];
	__xamarin_class_map [109].handle = [Microsoft_UI_Xaml_Documents_Glyphs class];
	__xamarin_class_map [110].handle = [Microsoft_UI_Xaml_Controls_AnimatedVisualPlayer class];
	__xamarin_class_map [111].handle = [Microsoft_UI_Xaml_Controls_AnnotatedScrollBar class];
	__xamarin_class_map [112].handle = [Microsoft_UI_Xaml_Controls_AppBarElementContainer class];
	__xamarin_class_map [113].handle = [Microsoft_UI_Xaml_Controls_AppBarSeparator class];
	__xamarin_class_map [114].handle = [Microsoft_UI_Xaml_Controls_AppBarToggleButton class];
	__xamarin_class_map [115].handle = [Microsoft_UI_Xaml_Controls_Button class];
	__xamarin_class_map [116].handle = [Microsoft_UI_Xaml_Controls_CheckBox class];
	__xamarin_class_map [117].handle = [Microsoft_UI_Xaml_Controls_ComboBoxItem class];
	__xamarin_class_map [118].handle = [Microsoft_UI_Xaml_Controls_DatePickerFlyoutPresenter class];
	__xamarin_class_map [119].handle = [Microsoft_UI_Xaml_Controls_DropDownButton class];
	__xamarin_class_map [120].handle = [Microsoft_UI_Xaml_Controls_Primitives_Selector class];
	__xamarin_class_map [121].handle = [Microsoft_UI_Xaml_Controls_FlipView class];
	__xamarin_class_map [122].handle = [Microsoft_UI_Xaml_Controls_FlipViewItem class];
	__xamarin_class_map [123].handle = [Microsoft_UI_Xaml_Controls_FlyoutPresenter class];
	__xamarin_class_map [124].handle = [Microsoft_UI_Xaml_Controls_ListViewBase class];
	__xamarin_class_map [125].handle = [Microsoft_UI_Xaml_Controls_GridView class];
	__xamarin_class_map [126].handle = [Microsoft_UI_Xaml_Controls_ListViewBaseHeaderItem class];
	__xamarin_class_map [127].handle = [Microsoft_UI_Xaml_Controls_GridViewHeaderItem class];
	__xamarin_class_map [128].handle = [Microsoft_UI_Xaml_Controls_GridViewItem class];
	__xamarin_class_map [129].handle = [Microsoft_UI_Xaml_Controls_GroupItem class];
	__xamarin_class_map [130].handle = [Microsoft_UI_Xaml_Controls_Hub class];
	__xamarin_class_map [131].handle = [Microsoft_UI_Xaml_Controls_HubSection class];
	__xamarin_class_map [132].handle = [Microsoft_UI_Xaml_Controls_IconElement class];
	__xamarin_class_map [133].handle = [Microsoft_UI_Xaml_Controls_ImageIcon class];
	__xamarin_class_map [134].handle = [Microsoft_UI_Xaml_Controls_InfoBadge class];
	__xamarin_class_map [135].handle = [Microsoft_UI_Xaml_Controls_InfoBar class];
	__xamarin_class_map [136].handle = [Microsoft_UI_Xaml_Controls_ListBox class];
	__xamarin_class_map [137].handle = [Microsoft_UI_Xaml_Controls_ListBoxItem class];
	__xamarin_class_map [138].handle = [Microsoft_UI_Xaml_Controls_ListPickerFlyoutPresenter class];
	__xamarin_class_map [139].handle = [Microsoft_UI_Xaml_Controls_ListView class];
	__xamarin_class_map [140].handle = [Microsoft_UI_Xaml_Controls_ListViewHeaderItem class];
	__xamarin_class_map [141].handle = [Microsoft_UI_Xaml_Controls_ListViewItem class];
	__xamarin_class_map [142].handle = [Microsoft_UI_Xaml_Controls_MapControl class];
	__xamarin_class_map [143].handle = [Microsoft_UI_Xaml_Controls_MenuBar class];
	__xamarin_class_map [144].handle = [Microsoft_UI_Xaml_Controls_MenuFlyoutItemBase class];
	__xamarin_class_map [145].handle = [Microsoft_UI_Xaml_Controls_MenuFlyoutSeparator class];
	__xamarin_class_map [146].handle = [Microsoft_UI_Xaml_Controls_NavigationViewItemBase class];
	__xamarin_class_map [147].handle = [Microsoft_UI_Xaml_Controls_NavigationViewItemHeader class];
	__xamarin_class_map [148].handle = [Microsoft_UI_Xaml_Controls_NavigationViewItemSeparator class];
	__xamarin_class_map [149].handle = [Microsoft_UI_Xaml_Controls_ParallaxView class];
	__xamarin_class_map [150].handle = [Microsoft_UI_Xaml_Controls_PersonPicture class];
	__xamarin_class_map [151].handle = [Microsoft_UI_Xaml_Controls_PickerFlyoutPresenter class];
	__xamarin_class_map [152].handle = [Microsoft_UI_Xaml_Controls_PivotItem class];
	__xamarin_class_map [153].handle = [Microsoft_UI_Xaml_Controls_Primitives_RangeBase class];
	__xamarin_class_map [154].handle = [Microsoft_UI_Xaml_Controls_ProgressBar class];
	__xamarin_class_map [155].handle = [Microsoft_UI_Xaml_Controls_RadioButton class];
	__xamarin_class_map [156].handle = [Microsoft_UI_Xaml_Controls_RefreshVisualizer class];
	__xamarin_class_map [157].handle = [Microsoft_UI_Xaml_Controls_Primitives_ListViewItemPresenter class];
	__xamarin_class_map [158].handle = [Microsoft_UI_Xaml_Controls_RevealListViewItemPresenter class];
	__xamarin_class_map [159].handle = [Microsoft_UI_Xaml_Controls_RichEditBox class];
	__xamarin_class_map [160].handle = [Microsoft_UI_Xaml_Controls_RichTextBlock class];
	__xamarin_class_map [161].handle = [Microsoft_UI_Xaml_Controls_RichTextBlockOverflow class];
	__xamarin_class_map [162].handle = [Microsoft_UI_Xaml_Controls_ScrollContentPresenter class];
	__xamarin_class_map [163].handle = [Microsoft_UI_Xaml_Controls_SelectorBar class];
	__xamarin_class_map [164].handle = [Microsoft_UI_Xaml_Controls_ItemContainer class];
	__xamarin_class_map [165].handle = [Microsoft_UI_Xaml_Controls_SelectorBarItem class];
	__xamarin_class_map [166].handle = [Microsoft_UI_Xaml_Controls_SemanticZoom class];
	__xamarin_class_map [167].handle = [Microsoft_UI_Xaml_Controls_SwapChainBackgroundPanel class];
	__xamarin_class_map [168].handle = [Microsoft_UI_Xaml_Controls_SwapChainPanel class];
	__xamarin_class_map [169].handle = [Microsoft_UI_Xaml_Controls_TabViewItem class];
	__xamarin_class_map [170].handle = [Microsoft_UI_Xaml_Controls_TimePickerFlyoutPresenter class];
	__xamarin_class_map [171].handle = [Microsoft_UI_Xaml_Controls_SplitButton class];
	__xamarin_class_map [172].handle = [Microsoft_UI_Xaml_Controls_ToggleSplitButton class];
	__xamarin_class_map [173].handle = [Microsoft_UI_Xaml_Controls_ToolTip class];
	__xamarin_class_map [174].handle = [Microsoft_UI_Xaml_Controls_TreeView class];
	__xamarin_class_map [175].handle = [Microsoft_UI_Xaml_Controls_Viewbox class];
	__xamarin_class_map [176].handle = [Microsoft_UI_Xaml_Controls_VirtualizingPanel class];
	__xamarin_class_map [177].handle = [Microsoft_UI_Xaml_Controls_Primitives_OrientedVirtualizingPanel class];
	__xamarin_class_map [178].handle = [Microsoft_UI_Xaml_Controls_VirtualizingStackPanel class];
	__xamarin_class_map [179].handle = [Microsoft_UI_Xaml_Controls_WrapGrid class];
	__xamarin_class_map [180].handle = [Microsoft_UI_Xaml_Controls_TextBlock class];
	__xamarin_class_map [181].handle = [Microsoft_UI_Xaml_Controls_ImplicitTextBlock class];
	__xamarin_class_map [182].handle = [Microsoft_UI_Xaml_Controls_Primitives_PopupPanel class];
	__xamarin_class_map [183].handle = [Microsoft_UI_Xaml_Controls_ContentDialogPopupPanel class];
	__xamarin_class_map [184].handle = [Microsoft_UI_Xaml_Controls_NativeDatePickerFlyoutPresenter class];
	__xamarin_class_map [185].handle = objc_getClass ("Microsoft_iOS__UIKit_UICollectionViewSource");
	__xamarin_class_map [186].handle = [Microsoft_UI_Xaml_Controls_FlipViewSource class];
	__xamarin_class_map [187].handle = objc_getClass ("UIScrollView");
	__xamarin_class_map [188].handle = objc_getClass ("UICollectionView");
	__xamarin_class_map [189].handle = [Microsoft_UI_Xaml_Controls_PagedCollectionView class];
	__xamarin_class_map [190].handle = [Microsoft_UI_Xaml_Controls_NativeFlipView class];
	__xamarin_class_map [191].handle = [Microsoft_UI_Xaml_Controls_FlyoutBasePopupPanel class];
	__xamarin_class_map [192].handle = [Microsoft_UI_Xaml_Controls_PickerFlyoutPopupPanel class];
	__xamarin_class_map [193].handle = objc_getClass ("UIImageView");
	__xamarin_class_map [194].handle = [Microsoft_UI_Xaml_Controls_NativeImageView class];
	__xamarin_class_map [195].handle = objc_getClass ("UICollectionViewLayout");
	__xamarin_class_map [196].handle = [Microsoft_UI_Xaml_Controls_VirtualizingPanelLayout class];
	__xamarin_class_map [197].handle = [Microsoft_UI_Xaml_Controls_ItemsStackPanelLayout class];
	__xamarin_class_map [198].handle = [Microsoft_UI_Xaml_Controls_ListViewBaseScrollContentPresenter class];
	__xamarin_class_map [199].handle = objc_getClass ("UICollectionReusableView");
	__xamarin_class_map [200].handle = objc_getClass ("UICollectionViewCell");
	__xamarin_class_map [201].handle = [Microsoft_UI_Xaml_Controls_ListViewBaseInternalContainer class];
	__xamarin_class_map [202].handle = [Microsoft_UI_Xaml_Controls_BlockLayout class];
	__xamarin_class_map [203].handle = [Microsoft_UI_Xaml_Controls_UnsetLayout class];
	__xamarin_class_map [204].handle = [Microsoft_UI_Xaml_Controls_NativePage class];
	__xamarin_class_map [205].handle = [Microsoft_UI_Xaml_Controls_PickerItem class];
	__xamarin_class_map [206].handle = objc_getClass ("Microsoft_iOS__UIKit_UIPickerViewModel");
	__xamarin_class_map [207].handle = [Microsoft_UI_Xaml_Controls_PickerModel class];
	__xamarin_class_map [208].handle = [Microsoft_UI_Xaml_Controls_Primitives_Popup class];
	__xamarin_class_map [209].handle = [Microsoft_UI_Xaml_Controls_NativePopupBase class];
	__xamarin_class_map [210].handle = [Microsoft_UI_Xaml_Controls_Popover class];
	__xamarin_class_map [211].handle = objc_getClass ("Microsoft_iOS__UIKit_UITextViewDelegate");
	__xamarin_class_map [212].handle = [Microsoft_UI_Xaml_Controls_MultilineTextBoxDelegate class];
	__xamarin_class_map [213].handle = [Microsoft_UI_Xaml_Controls_NativeTimePickerFlyoutPresenter class];
	__xamarin_class_map [214].handle = objc_getClass ("Microsoft_iOS__WebKit_WKUIDelegate");
	__xamarin_class_map [215].handle = [Microsoft_UI_Xaml_Controls_LocalWKUIDelegate class];
	__xamarin_class_map [216].handle = objc_getClass ("WKWebView");
	__xamarin_class_map [217].handle = [Microsoft_UI_Xaml_Controls_UnoWKWebView class];
	__xamarin_class_map [218].handle = [Microsoft_UI_Xaml_Controls_NativeWebView class];
	__xamarin_class_map [219].handle = [Microsoft_UI_Xaml_Controls_WindowView class];
	__xamarin_class_map [220].handle = [Microsoft_UI_Xaml_Controls_WrapPanel class];
	__xamarin_class_map [221].handle = [Microsoft_UI_Xaml_Controls_StackPanel class];
	__xamarin_class_map [222].handle = [Microsoft_UI_Xaml_Controls_Primitives_CarouselPanel class];
	__xamarin_class_map [223].handle = [Microsoft_UI_Xaml_Controls_Slider class];
	__xamarin_class_map [224].handle = [Microsoft_UI_Xaml_Controls_Primitives_ColorPickerSlider class];
	__xamarin_class_map [225].handle = [Microsoft_UI_Xaml_Controls_AppBar class];
	__xamarin_class_map [226].handle = [Microsoft_UI_Xaml_Controls_CommandBar class];
	__xamarin_class_map [227].handle = [Microsoft_UI_Xaml_Controls_Primitives_CommandBarFlyoutCommandBar class];
	__xamarin_class_map [228].handle = [Microsoft_UI_Xaml_Controls_Primitives_GridViewItemPresenter class];
	__xamarin_class_map [229].handle = [Microsoft_UI_Xaml_Controls_Primitives_InfoBarPanel class];
	__xamarin_class_map [230].handle = [Microsoft_UI_Xaml_Controls_Primitives_LoopingSelectorPanel class];
	__xamarin_class_map [231].handle = [Microsoft_UI_Xaml_Controls_Primitives_MonochromaticOverlayPresenter class];
	__xamarin_class_map [232].handle = [Microsoft_UI_Xaml_Controls_Primitives_PivotHeaderItem class];
	__xamarin_class_map [233].handle = [Microsoft_UI_Xaml_Controls_Primitives_PivotHeaderPanel class];
	__xamarin_class_map [234].handle = [Microsoft_UI_Xaml_Controls_Primitives_PivotPanel class];
	__xamarin_class_map [235].handle = [Microsoft_UI_Xaml_Controls_Primitives_RepeatButton class];
	__xamarin_class_map [236].handle = [Microsoft_UI_Xaml_Controls_Primitives_TabViewListView class];
	__xamarin_class_map [237].handle = [Microsoft_UI_Xaml_Controls_Primitives_Thumb class];
	__xamarin_class_map [238].handle = [Microsoft_UI_Xaml_Controls_Primitives_TickBar class];
	__xamarin_class_map [239].handle = [Uno_UI_Xaml_Islands_XamlIsland class];
	__xamarin_class_map [240].handle = [Uno_UI_Xaml_Islands_XamlIslandRootCollection class];
	__xamarin_class_map [241].handle = [Uno_UI_Xaml_Core_FullWindowMediaRoot class];
	__xamarin_class_map [242].handle = [Uno_UI_Xaml_Core_RootVisual class];
	__xamarin_class_map [243].handle = objc_getClass ("UIControl");
	__xamarin_class_map [244].handle = objc_getClass ("UIRefreshControl");
	__xamarin_class_map [245].handle = [Uno_UI_Xaml_Controls_NativeRefreshControl class];
	__xamarin_class_map [246].handle = [Uno_UI_Xaml_Controls_NativeRefreshVisualizer class];
	__xamarin_class_map [247].handle = [Uno_UI_Xaml_Controls_ProgressRingRefreshVisualizer class];
	__xamarin_class_map [248].handle = [Uno_UI_Xaml_Controls_WindowChrome class];
	__xamarin_class_map [249].handle = objc_getClass ("Microsoft_iOS__UIKit_UIGestureRecognizerDelegate");
	__xamarin_class_map [250].handle = [Uno_UI_Helpers_NativeFramePresenterUIGestureRecognizerDelegate class];
	__xamarin_class_map [251].handle = [Uno_UI_Views_Controls_DataTemplateSelectorControl class];
	__xamarin_class_map [252].handle = [Uno_UI_Controls_AppBarButtonWrapper class];
	__xamarin_class_map [253].handle = [Uno_UI_Controls_TitleView class];
	__xamarin_class_map [254].handle = [Uno_UI_Controls_LineView class];
	__xamarin_class_map [255].handle = objc_getClass ("Microsoft_iOS__UIKit_UIViewControllerTransitioningDelegate");
	__xamarin_class_map [256].handle = [Uno_UI_Controls_ViewControllerTransitioningDeligate class];
	__xamarin_class_map [257].handle = [Uno_UI_Views_Controls_BindableUICollectionView class];
	__xamarin_class_map [258].handle = [Uno_UI_Controls_Legacy_ListViewBase class];
	__xamarin_class_map [259].handle = [Uno_UI_Controls_Legacy_GridView class];
	__xamarin_class_map [260].handle = [Uno_UI_Controls_Legacy_ListViewBaseSource class];
	__xamarin_class_map [261].handle = [Uno_UI_Controls_Legacy_GridViewSource class];
	__xamarin_class_map [262].handle = [Uno_UI_Controls_Legacy_ListView class];
	__xamarin_class_map [263].handle = [Uno_UI_Controls_Legacy_ListViewSource class];
	__xamarin_class_map [264].handle = objc_getClass ("UIActivityIndicatorView");
	__xamarin_class_map [265].handle = [Uno_UI_Views_Controls_BindableUIActivityIndicatorView class];
	__xamarin_class_map [266].handle = [Uno_UI_Controls_Legacy_NativeProgressRing class];
	__xamarin_class_map [267].handle = [Uno_UI_Controls_Legacy_ProgressRing class];
	__xamarin_class_map [268].handle = [Microsoft_UI_Xaml_ElementStub class];
	__xamarin_class_map [269].handle = [Microsoft_UI_Xaml_Shapes_Polygon class];
	__xamarin_class_map [270].handle = [Microsoft_UI_Xaml_Shapes_Polyline class];
	__xamarin_class_map [271].handle = objc_getClass ("CALayer");
	__xamarin_class_map [272].handle = [Microsoft_UI_Xaml_Media_RadialGradientBrush_RadialGradientLayer class];
	__xamarin_class_map [273].handle = [Microsoft_UI_Xaml_Controls_AnimatedIcon class];
	__xamarin_class_map [274].handle = [Microsoft_UI_Xaml_Controls_AppBarButton class];
	__xamarin_class_map [275].handle = [Microsoft_UI_Xaml_Controls_AutoSuggestBox class];
	__xamarin_class_map [276].handle = [Microsoft_UI_Xaml_Controls_BitmapIcon class];
	__xamarin_class_map [277].handle = [Microsoft_UI_Xaml_Controls_BreadcrumbBar class];
	__xamarin_class_map [278].handle = [Microsoft_UI_Xaml_Controls_BreadcrumbBarItem class];
	__xamarin_class_map [279].handle = [Microsoft_UI_Xaml_Controls_CalendarDatePicker class];
	__xamarin_class_map [280].handle = [Microsoft_UI_Xaml_Controls_CalendarView class];
	__xamarin_class_map [281].handle = [Microsoft_UI_Xaml_Controls_CalendarViewBaseItem class];
	__xamarin_class_map [282].handle = [Microsoft_UI_Xaml_Controls_CalendarViewDayItem class];
	__xamarin_class_map [283].handle = [Microsoft_UI_Xaml_Controls_ColorPicker class];
	__xamarin_class_map [284].handle = [Microsoft_UI_Xaml_Controls_ComboBox class];
	__xamarin_class_map [285].handle = [Microsoft_UI_Xaml_Controls_CommandBarOverflowPresenter class];
	__xamarin_class_map [286].handle = [Microsoft_UI_Xaml_Controls_DatePicker class];
	__xamarin_class_map [287].handle = [Microsoft_UI_Xaml_Controls_Expander class];
	__xamarin_class_map [288].handle = [Microsoft_UI_Xaml_Controls_FontIcon class];
	__xamarin_class_map [289].handle = [Microsoft_UI_Xaml_Controls_Frame class];
	__xamarin_class_map [290].handle = [Microsoft_UI_Xaml_Controls_HyperlinkButton class];
	__xamarin_class_map [291].handle = [Microsoft_UI_Xaml_Controls_IconSourceElement class];
	__xamarin_class_map [292].handle = [Microsoft_UI_Xaml_Controls_Image class];
	__xamarin_class_map [293].handle = [Microsoft_UI_Xaml_Controls_ItemsPresenter class];
	__xamarin_class_map [294].handle = [Microsoft_UI_Xaml_Controls_ItemsRepeater class];
	__xamarin_class_map [295].handle = [Microsoft_UI_Xaml_Controls_ItemsRepeaterScrollHost class];
	__xamarin_class_map [296].handle = [Microsoft_UI_Xaml_Controls_ItemsStackPanel class];
	__xamarin_class_map [297].handle = [Microsoft_UI_Xaml_Controls_ItemsView class];
	__xamarin_class_map [298].handle = [Microsoft_UI_Xaml_Controls_ItemsWrapGrid class];
	__xamarin_class_map [299].handle = [Microsoft_UI_Xaml_Controls_MediaPlayerElement class];
	__xamarin_class_map [300].handle = [Microsoft_UI_Xaml_Controls_MediaPlayerPresenter class];
	__xamarin_class_map [301].handle = [Microsoft_UI_Xaml_Controls_MediaTransportControls class];
	__xamarin_class_map [302].handle = [Microsoft_UI_Xaml_Controls_MenuBarItem class];
	__xamarin_class_map [303].handle = [Microsoft_UI_Xaml_Controls_MenuFlyoutItem class];
	__xamarin_class_map [304].handle = [Microsoft_UI_Xaml_Controls_MenuFlyoutPresenter class];
	__xamarin_class_map [305].handle = [Microsoft_UI_Xaml_Controls_MenuFlyoutSubItem class];
	__xamarin_class_map [306].handle = [Microsoft_UI_Xaml_Controls_NavigationView class];
	__xamarin_class_map [307].handle = [Microsoft_UI_Xaml_Controls_NavigationViewItem class];
	__xamarin_class_map [308].handle = [Microsoft_UI_Xaml_Controls_NumberBox class];
	__xamarin_class_map [309].handle = [Microsoft_UI_Xaml_Controls_TextBox class];
	__xamarin_class_map [310].handle = [Microsoft_UI_Xaml_Controls_PasswordBox class];
	__xamarin_class_map [311].handle = [Microsoft_UI_Xaml_Controls_PathIcon class];
	__xamarin_class_map [312].handle = [Microsoft_UI_Xaml_Controls_PipsPager class];
	__xamarin_class_map [313].handle = [Microsoft_UI_Xaml_Controls_Pivot class];
	__xamarin_class_map [314].handle = [Microsoft_UI_Xaml_Controls_ProgressRing class];
	__xamarin_class_map [315].handle = [Microsoft_UI_Xaml_Controls_RadioButtons class];
	__xamarin_class_map [316].handle = [Microsoft_UI_Xaml_Controls_ToggleMenuFlyoutItem class];
	__xamarin_class_map [317].handle = [Microsoft_UI_Xaml_Controls_RadioMenuFlyoutItem class];
	__xamarin_class_map [318].handle = [Microsoft_UI_Xaml_Controls_RatingControl class];
	__xamarin_class_map [319].handle = [Microsoft_UI_Xaml_Controls_RefreshContainer class];
	__xamarin_class_map [320].handle = [Microsoft_UI_Xaml_Controls_ScrollView class];
	__xamarin_class_map [321].handle = [Microsoft_UI_Xaml_Controls_ScrollViewer class];
	__xamarin_class_map [322].handle = [Microsoft_UI_Xaml_Controls_SplitView class];
	__xamarin_class_map [323].handle = [Microsoft_UI_Xaml_Controls_SwipeControl class];
	__xamarin_class_map [324].handle = [Microsoft_UI_Xaml_Controls_SymbolIcon class];
	__xamarin_class_map [325].handle = [Microsoft_UI_Xaml_Controls_TabView class];
	__xamarin_class_map [326].handle = [Microsoft_UI_Xaml_Controls_TeachingTip class];
	__xamarin_class_map [327].handle = [Microsoft_UI_Xaml_Controls_TimePicker class];
	__xamarin_class_map [328].handle = [Microsoft_UI_Xaml_Controls_ToggleSwitch class];
	__xamarin_class_map [329].handle = [Microsoft_UI_Xaml_Controls_TreeViewItem class];
	__xamarin_class_map [330].handle = [Microsoft_UI_Xaml_Controls_TreeViewList class];
	__xamarin_class_map [331].handle = [Microsoft_UI_Xaml_Controls_TwoPaneView class];
	__xamarin_class_map [332].handle = [Microsoft_UI_Xaml_Controls_VariableSizedWrapGrid class];
	__xamarin_class_map [333].handle = [Microsoft_UI_Xaml_Controls_WebView2 class];
	__xamarin_class_map [334].handle = [Microsoft_UI_Xaml_Controls_LayoutPanel class];
	__xamarin_class_map [335].handle = [Microsoft_UI_Xaml_Controls_PagerControl class];
	__xamarin_class_map [336].handle = [Microsoft_UI_Xaml_Controls_CalendarViewItem class];
	__xamarin_class_map [337].handle = [Microsoft_UI_Xaml_Controls_DatePickerSelector class];
	__xamarin_class_map [338].handle = [Microsoft_UI_Xaml_Controls_ItemsWrapGridLayout class];
	__xamarin_class_map [339].handle = [Microsoft_UI_Xaml_Controls_ListViewBaseSource class];
	__xamarin_class_map [340].handle = [Microsoft_UI_Xaml_Controls_NativeListViewBase class];
	__xamarin_class_map [341].handle = objc_getClass ("UIPickerView");
	__xamarin_class_map [342].handle = [Microsoft_UI_Xaml_Controls_Picker class];
	__xamarin_class_map [343].handle = [Microsoft_UI_Xaml_Controls_NativePivotPresenter class];
	__xamarin_class_map [344].handle = [Microsoft_UI_Xaml_Controls_NativeScrollContentPresenter class];
	__xamarin_class_map [345].handle = objc_getClass ("UITextView");
	__xamarin_class_map [346].handle = [Microsoft_UI_Xaml_Controls_MultilineTextBoxView class];
	__xamarin_class_map [347].handle = objc_getClass ("Microsoft_iOS__UIKit_UITextFieldDelegate");
	__xamarin_class_map [348].handle = [Microsoft_UI_Xaml_Controls_SinglelineTextBoxDelegate class];
	__xamarin_class_map [349].handle = objc_getClass ("UITextField");
	__xamarin_class_map [350].handle = [Microsoft_UI_Xaml_Controls_SinglelineTextBoxView class];
	__xamarin_class_map [351].handle = [Microsoft_UI_Xaml_Controls_TimePickerSelector class];
	__xamarin_class_map [352].handle = objc_getClass ("Microsoft_iOS__WebKit_WKNavigationDelegate");
	__xamarin_class_map [353].handle = [Microsoft_UI_Xaml_Controls_WebViewNavigationDelegate class];
	__xamarin_class_map [354].handle = [Microsoft_UI_Xaml_Controls_WebView class];
	__xamarin_class_map [355].handle = [Microsoft_UI_Xaml_Controls_Primitives_CalendarPanel class];
	__xamarin_class_map [356].handle = [Microsoft_UI_Xaml_Controls_Primitives_ColorSpectrum class];
	__xamarin_class_map [357].handle = [Microsoft_UI_Xaml_Controls_Primitives_LoopingSelector class];
	__xamarin_class_map [358].handle = [Microsoft_UI_Xaml_Controls_Primitives_LoopingSelectorItem class];
	__xamarin_class_map [359].handle = [Microsoft_UI_Xaml_Controls_Primitives_NavigationViewItemPresenter class];
	__xamarin_class_map [360].handle = [Microsoft_UI_Xaml_Controls_Primitives_ScrollBar class];
	__xamarin_class_map [361].handle = [Microsoft_UI_Xaml_Controls_Primitives_ScrollPresenter class];
	__xamarin_class_map [362].handle = [Microsoft_UI_Xaml_Controls_Primitives_PopupRoot class];
	__xamarin_class_map [363].handle = [Uno_UI_WinRT_Extensions_UI_Popups_MessageDialogContentDialog class];
	__xamarin_class_map [364].handle = [Uno_UI_Xaml_Controls_SystemFocusVisual class];
	__xamarin_class_map [365].handle = objc_getClass ("UIAlertView");
	__xamarin_class_map [366].handle = [Uno_UI_Views_Controls_BindableUIAlertView class];
	__xamarin_class_map [367].handle = objc_getClass ("UIButton");
	__xamarin_class_map [368].handle = [Uno_UI_Views_Controls_BindableUIButton class];
	__xamarin_class_map [369].handle = objc_getClass ("UIProgressView");
	__xamarin_class_map [370].handle = [Uno_UI_Views_Controls_BindableUIProgressView class];
	__xamarin_class_map [371].handle = [Uno_UI_Views_Controls_BindableUIScrollView class];
	__xamarin_class_map [372].handle = objc_getClass ("UISwitch");
	__xamarin_class_map [373].handle = [Uno_UI_Views_Controls_BindableUISwitch class];
	__xamarin_class_map [374].handle = [Uno_UI_Views_Controls_StrategyBasedDataTemplateSelectorControl class];
	__xamarin_class_map [375].handle = objc_getClass ("UISearchBar");
	__xamarin_class_map [376].handle = [Uno_UI_Controls_BindableSearchBar class];
	__xamarin_class_map [377].handle = objc_getClass ("UISlider");
	__xamarin_class_map [378].handle = [Uno_UI_Controls_BindableUISlider class];
	__xamarin_class_map [379].handle = [Uno_UI_Controls_NativeCommandBarPresenter class];
	__xamarin_class_map [380].handle = [Uno_UI_Controls_FauxGradientBorderPresenter class];
	__xamarin_class_map [381].handle = [Uno_UI_Controls_NativeFramePresenter_PageViewController class];
	__xamarin_class_map [382].handle = [Uno_UI_Controls_NativeFramePresenter_ControllerDelegate class];
	__xamarin_class_map [383].handle = [Uno_UI_Controls_NativeFramePresenter class];
	__xamarin_class_map [384].handle = [Uno_UI_Controls_RootViewController class];
	__xamarin_class_map [385].handle = [Uno_UI_Controls_StatePresenter class];
	__xamarin_class_map [386].handle = objc_getClass ("UINavigationBar");
	__xamarin_class_map [387].handle = [Uno_UI_Controls_UnoNavigationBar class];
	__xamarin_class_map [388].handle = [Uno_UI_Controls_ManagedItemsStackPanel class];
	__xamarin_class_map [389].handle = objc_getClass ("UIWindow");
	__xamarin_class_map [390].handle = [Uno_UI_Controls_Window class];
	__xamarin_class_map [391].handle = [Uno_UI_Controls_Legacy_ListViewBaseLayout class];
	__xamarin_class_map [392].handle = [Uno_UI_Controls_Legacy_GridViewWrapGridLayout class];
	__xamarin_class_map [393].handle = [LegacyInternalContainer class];
	__xamarin_class_map [394].handle = [Uno_UI_Controls_Legacy_ListViewLayout class];
	__xamarin_class_map [395].handle = [Uno_UI_Controls_NativeFramePresenter_FrameNavigationController class];
	__xamarin_class_map [396].handle = [Uno_Media_Playback_VideoSurface class];
	__xamarin_class_map [397].handle = objc_getClass ("Microsoft_iOS__UIKit_UIImagePickerControllerDelegate");
	__xamarin_class_map [398].handle = [Windows_Media_Capture_CameraDelegate class];
	__xamarin_class_map [399].handle = objc_getClass ("Microsoft_iOS__CallKit_CXCallObserverDelegate");
	__xamarin_class_map [400].handle = [Windows_ApplicationModel_Calls_CallObserverDelegate class];
	__xamarin_class_map [401].handle = [Uno_AuthenticationBroker_WebAuthenticationBrokerProvider_PresentationContextProviderToSharedKeyWindow class];
	__xamarin_class_map [402].handle = [Windows_Storage_Pickers_FileOpenPicker_ImageOpenPickerDelegate class];
	__xamarin_class_map [403].handle = objc_getClass ("Microsoft_iOS__UIKit_UIAdaptivePresentationControllerDelegate");
	__xamarin_class_map [404].handle = [Windows_Storage_Pickers_FileOpenPicker_FileOpenPickerPresentationControllerDelegate class];
	__xamarin_class_map [405].handle = objc_getClass ("Microsoft_iOS__UIKit_UIDocumentPickerDelegate");
	__xamarin_class_map [406].handle = [Windows_Storage_Pickers_FolderPicker_FolderPickerDelegate class];
	__xamarin_class_map [407].handle = [Windows_Storage_Pickers_FolderPicker_FolderPickerPresentationControllerDelegate class];
	__xamarin_class_map [408].handle = [Windows_Media_Playback_MediaPlayer_Observer class];
	__xamarin_class_map [409].handle = objc_getClass ("UIImagePickerController");
	__xamarin_class_map [410].handle = [Windows_Media_Capture_CameraCaptureUI_LockedOrientationUIImagePickerController class];
	__xamarin_class_map [411].handle = [Windows_Devices_Geolocation_Geolocator_CLLocationManagerDelegate class];
	__xamarin_class_map [412].handle = objc_getClass ("Microsoft_iOS__UIKit_UIActivityItemSource");
	__xamarin_class_map [413].handle = [Windows_ApplicationModel_DataTransfer_DataTransferManager_DataActivityItemSource class];
	__xamarin_class_map [414].handle = objc_getClass ("Microsoft_iOS__ContactsUI_CNContactPickerDelegate");
	__xamarin_class_map [415].handle = [Windows_ApplicationModel_Contacts_ContactPicker_SingleContactPickerDelegate class];
	__xamarin_class_map [416].handle = [Windows_ApplicationModel_Contacts_ContactPicker_MultipleContactPickerDelegate class];
	__xamarin_class_map [417].handle = objc_getClass ("Microsoft_iOS__PhotosUI_PHPickerViewControllerDelegate");
	__xamarin_class_map [418].handle = [Windows_Storage_Pickers_FileOpenPicker_PhotoPickerDelegate class];
	__xamarin_class_map [419].handle = [Windows_Storage_Pickers_FileOpenPicker_FileOpenPickerDelegate class];
	__xamarin_class_map [420].handle = [Uno_UI_RemoteControl_RemoteControlStatusView class];
	__xamarin_class_map [421].handle = objc_getClass ("PHPickerResult");
	__xamarin_class_map [422].handle = objc_getClass ("PHPickerViewController");
	__xamarin_class_map [423].handle = objc_getClass ("CNContactPickerViewController");
	__xamarin_class_map [424].handle = objc_getClass ("EAGLContext");
	__xamarin_class_map [425].handle = objc_getClass ("MFMailComposeViewController");
	__xamarin_class_map [426].handle = objc_getClass ("Microsoft_iOS__MessageUI_MFMailComposeViewControllerDelegate");
	__xamarin_class_map [427].handle = objc_getClass ("MessageUI_Mono_MFMailComposeViewControllerDelegate");
	__xamarin_class_map [428].handle = objc_getClass ("WKPreferences");
	__xamarin_class_map [429].handle = objc_getClass ("WKWindowFeatures");
	__xamarin_class_map [430].handle = objc_getClass ("WKBackForwardList");
	__xamarin_class_map [431].handle = objc_getClass ("WKBackForwardListItem");
	__xamarin_class_map [432].handle = objc_getClass ("WKContextMenuElementInfo");
	__xamarin_class_map [433].handle = objc_getClass ("WKDownload");
	__xamarin_class_map [434].handle = objc_getClass ("WKFrameInfo");
	__xamarin_class_map [435].handle = objc_getClass ("WKNavigation");
	__xamarin_class_map [436].handle = objc_getClass ("WKNavigationAction");
	__xamarin_class_map [437].handle = objc_getClass ("WKNavigationResponse");
	__xamarin_class_map [438].handle = objc_getClass ("WKPreviewElementInfo");
	__xamarin_class_map [439].handle = objc_getClass ("WKScriptMessage");
	__xamarin_class_map [440].handle = objc_getClass ("WKSecurityOrigin");
	__xamarin_class_map [441].handle = objc_getClass ("WKUserContentController");
	__xamarin_class_map [442].handle = objc_getClass ("WKWebpagePreferences");
	__xamarin_class_map [443].handle = objc_getClass ("WKWebViewConfiguration");
	__xamarin_class_map [444].handle = objc_getClass ("NSIndexPath");
	__xamarin_class_map [445].handle = objc_getClass ("Foundation_NSDispatcher");
	__xamarin_class_map [446].handle = objc_getClass ("__MonoMac_NSActionDispatcher");
	__xamarin_class_map [447].handle = objc_getClass ("__MonoMac_NSSynchronizationContextDispatcher");
	__xamarin_class_map [448].handle = objc_getClass ("Foundation_NSAsyncDispatcher");
	__xamarin_class_map [449].handle = objc_getClass ("__MonoMac_NSAsyncActionDispatcher");
	__xamarin_class_map [450].handle = objc_getClass ("__MonoMac_NSAsyncSynchronizationContextDispatcher");
	__xamarin_class_map [451].handle = objc_getClass ("NSArray");
	__xamarin_class_map [452].handle = objc_getClass ("NSAttributedString");
	__xamarin_class_map [453].handle = objc_getClass ("NSBundle");
	__xamarin_class_map [454].handle = objc_getClass ("NSCalendar");
	__xamarin_class_map [455].handle = objc_getClass ("NSCoder");
	__xamarin_class_map [456].handle = objc_getClass ("NSDate");
	__xamarin_class_map [457].handle = objc_getClass ("NSDateComponents");
	__xamarin_class_map [458].handle = objc_getClass ("NSError");
	__xamarin_class_map [459].handle = objc_getClass ("Foundation_NSExceptionError");
	__xamarin_class_map [460].handle = objc_getClass ("NSFileManager");
	__xamarin_class_map [461].handle = objc_getClass ("NSHTTPCookie");
	__xamarin_class_map [462].handle = objc_getClass ("NSStream");
	__xamarin_class_map [463].handle = objc_getClass ("NSInputStream");
	__xamarin_class_map [464].handle = objc_getClass ("NSLocale");
	__xamarin_class_map [465].handle = objc_getClass ("NSMutableAttributedString");
	__xamarin_class_map [466].handle = objc_getClass ("NSSet");
	__xamarin_class_map [467].handle = objc_getClass ("NSMutableSet");
	__xamarin_class_map [468].handle = objc_getClass ("NSURLRequest");
	__xamarin_class_map [469].handle = objc_getClass ("NSMutableURLRequest");
	__xamarin_class_map [470].handle = objc_getClass ("Foundation_InternalNSNotificationHandler");
	__xamarin_class_map [471].handle = objc_getClass ("NSNull");
	__xamarin_class_map [472].handle = objc_getClass ("NSValue");
	__xamarin_class_map [473].handle = objc_getClass ("NSNumber");
	__xamarin_class_map [474].handle = objc_getClass ("NSProgress");
	__xamarin_class_map [475].handle = objc_getClass ("NSProxy");
	__xamarin_class_map [476].handle = objc_getClass ("NSRunLoop");
	__xamarin_class_map [477].handle = objc_getClass ("NSString");
	__xamarin_class_map [478].handle = objc_getClass ("NSThread");
	__xamarin_class_map [479].handle = objc_getClass ("NSTimeZone");
	__xamarin_class_map [480].handle = objc_getClass ("NSTimer");
	__xamarin_class_map [481].handle = objc_getClass ("NSUndoManager");
	__xamarin_class_map [482].handle = objc_getClass ("NSURL");
	__xamarin_class_map [483].handle = objc_getClass ("NSURLCredential");
	__xamarin_class_map [484].handle = objc_getClass ("NSURLProtectionSpace");
	__xamarin_class_map [485].handle = objc_getClass ("NSUserDefaults");
	__xamarin_class_map [486].handle = objc_getClass ("NSAutoreleasePool");
	__xamarin_class_map [487].handle = objc_getClass ("NSCachedURLResponse");
	__xamarin_class_map [488].handle = objc_getClass ("NSEnumerator");
	__xamarin_class_map [489].handle = objc_getClass ("NSException");
	__xamarin_class_map [490].handle = objc_getClass ("NSHTTPCookieStorage");
	__xamarin_class_map [491].handle = objc_getClass ("NSURLResponse");
	__xamarin_class_map [492].handle = objc_getClass ("NSHTTPURLResponse");
	__xamarin_class_map [493].handle = objc_getClass ("NSIndexSet");
	__xamarin_class_map [494].handle = objc_getClass ("NSJSONSerialization");
	__xamarin_class_map [495].handle = objc_getClass ("NSNotification");
	__xamarin_class_map [496].handle = objc_getClass ("NSOperationQueue");
	__xamarin_class_map [497].handle = objc_getClass ("NSProcessInfo");
	__xamarin_class_map [498].handle = objc_getClass ("NSStringDrawingContext");
	__xamarin_class_map [499].handle = objc_getClass ("NSURLAuthenticationChallenge");
	__xamarin_class_map [500].handle = objc_getClass ("Microsoft_iOS__Foundation_NSUrlSessionDelegate");
	__xamarin_class_map [501].handle = objc_getClass ("Microsoft_iOS__Foundation_NSUrlSessionTaskDelegate");
	__xamarin_class_map [502].handle = objc_getClass ("Microsoft_iOS__Foundation_NSUrlSessionDataDelegate");
	__xamarin_class_map [503].handle = objc_getClass ("NSURLSessionTask");
	__xamarin_class_map [504].handle = objc_getClass ("NSURLSessionDataTask");
	__xamarin_class_map [505].handle = objc_getClass ("NSUserActivity");
	__xamarin_class_map [506].handle = objc_getClass ("CLLocationManager");
	__xamarin_class_map [507].handle = objc_getClass ("CLBeacon");
	__xamarin_class_map [508].handle = objc_getClass ("CLBeaconIdentityConstraint");
	__xamarin_class_map [509].handle = objc_getClass ("CLRegion");
	__xamarin_class_map [510].handle = objc_getClass ("CLBeaconRegion");
	__xamarin_class_map [511].handle = objc_getClass ("CLHeading");
	__xamarin_class_map [512].handle = objc_getClass ("CLLocation");
	__xamarin_class_map [513].handle = objc_getClass ("CLVisit");
	__xamarin_class_map [514].handle = objc_getClass ("CAAnimation");
	__xamarin_class_map [515].handle = objc_getClass ("CAPropertyAnimation");
	__xamarin_class_map [516].handle = objc_getClass ("CABasicAnimation");
	__xamarin_class_map [517].handle = objc_getClass ("CAGradientLayer");
	__xamarin_class_map [518].handle = objc_getClass ("CAKeyframeAnimation");
	__xamarin_class_map [519].handle = objc_getClass ("CADisplayLink");
	__xamarin_class_map [520].handle = objc_getClass ("Microsoft_iOS__CoreAnimation_CALayerDelegate");
	__xamarin_class_map [521].handle = objc_getClass ("CAMediaTimingFunction");
	__xamarin_class_map [522].handle = objc_getClass ("CAShapeLayer");
	__xamarin_class_map [523].handle = objc_getClass ("CATransaction");
	__xamarin_class_map [524].handle = objc_getClass ("CNContact");
	__xamarin_class_map [525].handle = objc_getClass ("CXCall");
	__xamarin_class_map [526].handle = objc_getClass ("CXCallObserver");
	__xamarin_class_map [527].handle = objc_getClass ("ASWebAuthenticationSession");
	__xamarin_class_map [528].handle = objc_getClass ("NSLayoutManager");
	__xamarin_class_map [529].handle = objc_getClass ("NSLayoutConstraint");
	__xamarin_class_map [530].handle = objc_getClass ("UIAccessibilityCustomAction");
	__xamarin_class_map [531].handle = objc_getClass ("Microsoft_iOS__UIKit_UIAppearance");
	__xamarin_class_map [532].handle = objc_getClass ("UIBarItem");
	__xamarin_class_map [533].handle = objc_getClass ("UIBezierPath");
	__xamarin_class_map [534].handle = objc_getClass ("UICollectionViewLayoutAttributes");
	__xamarin_class_map [535].handle = objc_getClass ("UIColor");
	__xamarin_class_map [536].handle = objc_getClass ("UIKit_UIControlEventProxy");
	__xamarin_class_map [537].handle = objc_getClass ("UIDevice");
	__xamarin_class_map [538].handle = objc_getClass ("UIEvent");
	__xamarin_class_map [539].handle = objc_getClass ("UIFont");
	__xamarin_class_map [540].handle = objc_getClass ("UIFontDescriptor");
	__xamarin_class_map [541].handle = objc_getClass ("UIGestureRecognizer");
	__xamarin_class_map [542].handle = objc_getClass ("UIPanGestureRecognizer");
	__xamarin_class_map [543].handle = objc_getClass ("UIPinchGestureRecognizer");
	__xamarin_class_map [544].handle = objc_getClass ("UIImage");
	__xamarin_class_map [545].handle = objc_getClass ("UIMenuElement");
	__xamarin_class_map [546].handle = objc_getClass ("UIMenu");
	__xamarin_class_map [547].handle = objc_getClass ("UIPasteboard");
	__xamarin_class_map [548].handle = objc_getClass ("UIPresentationController");
	__xamarin_class_map [549].handle = objc_getClass ("UIPopoverPresentationController");
	__xamarin_class_map [550].handle = objc_getClass ("UIScreen");
	__xamarin_class_map [551].handle = objc_getClass ("UIToolbar");
	__xamarin_class_map [552].handle = objc_getClass ("UIScene");
	__xamarin_class_map [553].handle = objc_getClass ("UIWindowScene");
	__xamarin_class_map [554].handle = objc_getClass ("UITraitCollection");
	__xamarin_class_map [555].handle = objc_getClass ("NSAdaptiveImageGlyph");
	__xamarin_class_map [556].handle = objc_getClass ("NSLayoutAnchor");
	__xamarin_class_map [557].handle = objc_getClass ("NSLayoutDimension");
	__xamarin_class_map [558].handle = objc_getClass ("NSLayoutXAxisAnchor");
	__xamarin_class_map [559].handle = objc_getClass ("NSLayoutYAxisAnchor");
	__xamarin_class_map [560].handle = objc_getClass ("NSParagraphStyle");
	__xamarin_class_map [561].handle = objc_getClass ("NSMutableParagraphStyle");
	__xamarin_class_map [562].handle = objc_getClass ("NSTextAttachment");
	__xamarin_class_map [563].handle = objc_getClass ("NSTextContainer");
	__xamarin_class_map [564].handle = objc_getClass ("NSTextLayoutManager");
	__xamarin_class_map [565].handle = objc_getClass ("NSTextStorage");
	__xamarin_class_map [566].handle = objc_getClass ("UIAccessibilityLocationDescriptor");
	__xamarin_class_map [567].handle = objc_getClass ("UIAction");
	__xamarin_class_map [568].handle = objc_getClass ("UIActivity");
	__xamarin_class_map [569].handle = objc_getClass ("UIActivityViewController");
	__xamarin_class_map [570].handle = objc_getClass ("UIAlertAction");
	__xamarin_class_map [571].handle = objc_getClass ("UIAlertController");
	__xamarin_class_map [572].handle = objc_getClass ("Microsoft_iOS__UIKit_UIAlertViewDelegate");
	__xamarin_class_map [573].handle = objc_getClass ("UIApplicationShortcutItem");
	__xamarin_class_map [574].handle = objc_getClass ("UIBarAppearance");
	__xamarin_class_map [575].handle = objc_getClass ("UIBarButtonItemAppearance");
	__xamarin_class_map [576].handle = objc_getClass ("UIBarButtonItemStateAppearance");
	__xamarin_class_map [577].handle = objc_getClass ("UIVisualEffect");
	__xamarin_class_map [578].handle = objc_getClass ("UIBlurEffect");
	__xamarin_class_map [579].handle = objc_getClass ("UIButtonConfiguration");
	__xamarin_class_map [580].handle = objc_getClass ("UICollectionViewPlaceholder");
	__xamarin_class_map [581].handle = objc_getClass ("UICollectionViewDropPlaceholder");
	__xamarin_class_map [582].handle = objc_getClass ("UIDropProposal");
	__xamarin_class_map [583].handle = objc_getClass ("UICollectionViewDropProposal");
	__xamarin_class_map [584].handle = objc_getClass ("UICollectionViewFlowLayout");
	__xamarin_class_map [585].handle = objc_getClass ("UIFocusUpdateContext");
	__xamarin_class_map [586].handle = objc_getClass ("UICollectionViewFocusUpdateContext");
	__xamarin_class_map [587].handle = objc_getClass ("UICollectionViewTransitionLayout");
	__xamarin_class_map [588].handle = objc_getClass ("UICollectionViewUpdateItem");
	__xamarin_class_map [589].handle = objc_getClass ("UICommand");
	__xamarin_class_map [590].handle = objc_getClass ("UIContextMenuConfiguration");
	__xamarin_class_map [591].handle = objc_getClass ("UIContextMenuInteraction");
	__xamarin_class_map [592].handle = objc_getClass ("UICubicTimingParameters");
	__xamarin_class_map [593].handle = objc_getClass ("UIDocument");
	__xamarin_class_map [594].handle = objc_getClass ("UIDocumentPickerViewController");
	__xamarin_class_map [595].handle = objc_getClass ("UIDragInteraction");
	__xamarin_class_map [596].handle = objc_getClass ("UIDragItem");
	__xamarin_class_map [597].handle = objc_getClass ("UIPreviewParameters");
	__xamarin_class_map [598].handle = objc_getClass ("UIDragPreviewParameters");
	__xamarin_class_map [599].handle = objc_getClass ("UIPreviewTarget");
	__xamarin_class_map [600].handle = objc_getClass ("UIDragPreviewTarget");
	__xamarin_class_map [601].handle = objc_getClass ("UIDropInteraction");
	__xamarin_class_map [602].handle = objc_getClass ("UIFeedbackGenerator");
	__xamarin_class_map [603].handle = objc_getClass ("UIFindInteraction");
	__xamarin_class_map [604].handle = objc_getClass ("UIFocusAnimationCoordinator");
	__xamarin_class_map [605].handle = objc_getClass ("UIFocusEffect");
	__xamarin_class_map [606].handle = objc_getClass ("UIFocusMovementHint");
	__xamarin_class_map [607].handle = objc_getClass ("UIHoverStyle");
	__xamarin_class_map [608].handle = objc_getClass ("UIImageConfiguration");
	__xamarin_class_map [609].handle = objc_getClass ("UIImageSymbolConfiguration");
	__xamarin_class_map [610].handle = objc_getClass ("UIImpactFeedbackGenerator");
	__xamarin_class_map [611].handle = objc_getClass ("UIInputViewController");
	__xamarin_class_map [612].handle = objc_getClass ("UIKey");
	__xamarin_class_map [613].handle = objc_getClass ("UILayoutGuide");
	__xamarin_class_map [614].handle = objc_getClass ("UITrackingLayoutGuide");
	__xamarin_class_map [615].handle = objc_getClass ("UIKeyboardLayoutGuide");
	__xamarin_class_map [616].handle = objc_getClass ("UIKeyCommand");
	__xamarin_class_map [617].handle = objc_getClass ("UILabel");
	__xamarin_class_map [618].handle = objc_getClass ("UIMotionEffect");
	__xamarin_class_map [619].handle = objc_getClass ("UINavigationBarAppearance");
	__xamarin_class_map [620].handle = objc_getClass ("UINavigationItem");
	__xamarin_class_map [621].handle = objc_getClass ("UIPasteConfiguration");
	__xamarin_class_map [622].handle = objc_getClass ("UIPointerEffect");
	__xamarin_class_map [623].handle = objc_getClass ("UIPointerShape");
	__xamarin_class_map [624].handle = objc_getClass ("UIPointerStyle");
	__xamarin_class_map [625].handle = objc_getClass ("UIPress");
	__xamarin_class_map [626].handle = objc_getClass ("UIPressesEvent");
	__xamarin_class_map [627].handle = objc_getClass ("UIPrintFormatter");
	__xamarin_class_map [628].handle = objc_getClass ("UISearchTextField");
	__xamarin_class_map [629].handle = objc_getClass ("UISpringTimingParameters");
	__xamarin_class_map [630].handle = objc_getClass ("UIStatusBarManager");
	__xamarin_class_map [631].handle = objc_getClass ("UIStoryboard");
	__xamarin_class_map [632].handle = objc_getClass ("UITabBarItem");
	__xamarin_class_map [633].handle = objc_getClass ("UITargetedPreview");
	__xamarin_class_map [634].handle = objc_getClass ("UITargetedDragPreview");
	__xamarin_class_map [635].handle = objc_getClass ("UITextDropProposal");
	__xamarin_class_map [636].handle = objc_getClass ("UITextFormattingViewController");
	__xamarin_class_map [637].handle = objc_getClass ("UITextFormattingViewControllerConfiguration");
	__xamarin_class_map [638].handle = objc_getClass ("UITextInputAssistantItem");
	__xamarin_class_map [639].handle = objc_getClass ("UITextInputMode");
	__xamarin_class_map [640].handle = objc_getClass ("UITextInputPasswordRules");
	__xamarin_class_map [641].handle = objc_getClass ("UITextItem");
	__xamarin_class_map [642].handle = objc_getClass ("UITextItemMenuConfiguration");
	__xamarin_class_map [643].handle = objc_getClass ("UITextPlaceholder");
	__xamarin_class_map [644].handle = objc_getClass ("UITextPosition");
	__xamarin_class_map [645].handle = objc_getClass ("UITextRange");
	__xamarin_class_map [646].handle = objc_getClass ("UITextSelectionRect");
	__xamarin_class_map [647].handle = objc_getClass ("UIToolTipInteraction");
	__xamarin_class_map [648].handle = objc_getClass ("UITouch");
	__xamarin_class_map [649].handle = objc_getClass ("UIViewPrintFormatter");
	__xamarin_class_map [650].handle = objc_getClass ("UIVisualEffectView");
	__xamarin_class_map [651].handle = objc_getClass ("UIWebView");
	__xamarin_class_map [652].handle = objc_getClass ("UIWindowSceneActivationConfiguration");
	__xamarin_class_map [653].handle = objc_getClass ("AVPlayerLayer");
	__xamarin_class_map [654].handle = objc_getClass ("AVPlayer");
	__xamarin_class_map [655].handle = objc_getClass ("AVAudioSession");
	__xamarin_class_map [656].handle = objc_getClass ("AVAsset");
	__xamarin_class_map [657].handle = objc_getClass ("AVPlayerItemTrack");
	__xamarin_class_map [658].handle = objc_getClass ("AVQueuePlayer");
	__xamarin_class_map [659].handle = objc_getClass ("GLKit_GLKView__GLKViewDelegate");
	__xamarin_class_map [660].handle = objc_getClass ("NSData");
	__xamarin_class_map [661].handle = objc_getClass ("NSDictionary");
	__xamarin_class_map [662].handle = objc_getClass ("NSItemProvider");
	__xamarin_class_map [663].handle = objc_getClass ("NSMutableData");
	__xamarin_class_map [664].handle = objc_getClass ("NSMutableDictionary");
	__xamarin_class_map [665].handle = objc_getClass ("NSNotificationCenter");
	__xamarin_class_map [666].handle = objc_getClass ("__NSObject_Disposer");
	__xamarin_class_map [667].handle = objc_getClass ("NSURLSessionConfiguration");
	__xamarin_class_map [668].handle = objc_getClass ("NSURLSession");
	__xamarin_class_map [669].handle = objc_getClass ("CoreAnimation_CAAnimation__CAAnimationDelegate");
	__xamarin_class_map [670].handle = objc_getClass ("System_Net_Http_NSUrlSessionHandler_WrappedNSInputStream");
	__xamarin_class_map [671].handle = objc_getClass ("UIKit_UIActionSheet__UIActionSheetDelegate");
	__xamarin_class_map [672].handle = objc_getClass ("UIActionSheet");
	__xamarin_class_map [673].handle = objc_getClass ("UIKit_UIAlertView__UIAlertViewDelegate");
	__xamarin_class_map [674].handle = objc_getClass ("UIApplication");
	__xamarin_class_map [675].handle = objc_getClass ("UIKit_UIBarButtonItem_Callback");
	__xamarin_class_map [676].handle = objc_getClass ("UIBarButtonItem");
	__xamarin_class_map [677].handle = objc_getClass ("UIKit_UIView_UIViewAppearance");
	__xamarin_class_map [678].handle = objc_getClass ("UIKit_UIControl_UIControlAppearance");
	__xamarin_class_map [679].handle = objc_getClass ("__UIGestureRecognizerToken");
	__xamarin_class_map [680].handle = objc_getClass ("UIKit_UIPopoverController__UIPopoverControllerDelegate");
	__xamarin_class_map [681].handle = objc_getClass ("UIPopoverController");
	__xamarin_class_map [682].handle = objc_getClass ("UIKit_UISearchBar__UISearchBarDelegate");
	__xamarin_class_map [683].handle = objc_getClass ("UIKit_UITextField__UITextFieldDelegate");
	__xamarin_class_map [684].handle = objc_getClass ("UIKit_UIScrollView__UIScrollViewDelegate");
	__xamarin_class_map [685].handle = objc_getClass ("UIKit_UITextView__UITextViewDelegate");
	__xamarin_class_map [686].handle = objc_getClass ("UIKit_UIDatePicker_UIDatePickerAppearance");
	__xamarin_class_map [687].handle = objc_getClass ("UIDatePicker");
	__xamarin_class_map [688].handle = objc_getClass ("UIKit_UITabBar__UITabBarDelegate");
	__xamarin_class_map [689].handle = objc_getClass ("UITabBar");
	__xamarin_class_map [690].handle = objc_getClass ("AVPlayerItem");
	__xamarin_class_map [691].handle = objc_getClass ("AVAssetTrack");
	__xamarin_class_map [692].handle = objc_getClass ("System_Net_Http_NSUrlSessionHandler_NSUrlSessionHandlerDelegate");
	xamarin_add_registration_map (&__xamarin_registration_map, false);
}


} /* extern "C" */
