Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 682BCA771A5
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 02:01:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 84BE446D67
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 00:01:41 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	by lists.linaro.org (Postfix) with ESMTPS id E8DDD44331
	for <greybus-dev@lists.linaro.org>; Mon, 31 Mar 2025 23:31:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=L1Z+50wv;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.210.46 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72c40235c34so1261287a34.3
        for <greybus-dev@lists.linaro.org>; Mon, 31 Mar 2025 16:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1743463880; x=1744068680; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJ+toMwTx18/8SXmfnJl/GpEKdrIgAfy+X1oEZCBOJg=;
        b=L1Z+50wvKBfFszU7RXM7KjWMhDFiabtEKbj3uF0oWS+dKtTZj67DGGdfNHyrNOGyeq
         rIQxpRYuQHQ19GhLqb6DdFzaj3od/mCZvx0yorHIxUb2jTiOQDrfTNtmB6wjpmGTr4hv
         REID1mrcevcoL0PBlevrLaSMc/hyW4NuyJatI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743463880; x=1744068680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJ+toMwTx18/8SXmfnJl/GpEKdrIgAfy+X1oEZCBOJg=;
        b=lUTMF3xoS34l9JaJhbAsrjZxVfBFH+ZAhqHf/yr3AgW0AoFpceeGV2QiwLuja7cWtB
         5rz/rAWChf+yqx7wdUS+tD641sKD6PVUZ1OdGWo3D8ycU3KTvY8r7PmaHtce1W3+e5cn
         M+ny3O0qdBXnYReyXUTgjgDxc1kk7Ou7/VtQyiPB9xbdj+kgwQECambVOSrx3fIYjfa6
         p+Is7Zwf7zdrV060C4/hgZpbqfVKHESwbHQQC3HmoY+S06kN1QBhwNewCRkfX06Dq57z
         a9ccHgz2/FPnfsBTjldKTNuRIy1jpPLwDLT+wQGNUUbifHRRfUX7NoremCKzlkOywKWv
         XH1A==
X-Gm-Message-State: AOJu0YwgDn+pSjYeiHwTyPXDMD3QP3HI1kg4fDa+WXEkHPXEAmg2DPsD
	w9jBhCYvU43V6Dd1Bp/LIWZDVRwKAvFch17JAEgfHk5XMjl614Is7uoPiabd8w==
X-Gm-Gg: ASbGncvXdtgaSm4HkiZFsBL7gju9UXwMJ9vObDOjxL7lOUxWXUivuq1lGAkibdZY0WT
	8hrlL8mZlnkybyL9kpDEyGmfmJXjOxa3mpg2hb7S+ZUNL9RGWqhIaWL87HKvPxQTCmccKJR7HHv
	drUUitd5JpaO0ispqQylmPbcW9tpsTDBLnRgGKYSX5BF5+6YCluBoaVIcILd6Tkk9DwP6VU03r0
	mezkAxsh6hiAXLjdcMGVeBt3QCtGhmoQTCWdkCkAq0l0QlJxr+bmvJhY+QAA43F0fqdWkx+X0hL
	Qxy+DEyzyxd1aAe+xNS2UmDFFc3RmpsfbWsq/tyvhDfO7zHVSeKz+keW3X5DSb1WBy6TpEVuC9i
	VDQ8=
X-Google-Smtp-Source: AGHT+IEwmB2bcjMGzxlQpjRzg7wCA5OuVgfgfv5l11OQr+T9wVt6H6VgPvMbOoFq7GQ9enxJDZiAfA==
X-Received: by 2002:a05:6830:699b:b0:72c:320b:f76b with SMTP id 46e09a7af769-72c6376d027mr6148642a34.1.1743463880158;
        Mon, 31 Mar 2025 16:31:20 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-72c580cd6c5sm1662891a34.32.2025.03.31.16.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 16:31:18 -0700 (PDT)
Message-ID: <8a68ab78-cf18-4937-a8b7-fb0fa41c9d53@ieee.org>
Date: Mon, 31 Mar 2025 18:31:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thorsten Blum <thorsten.blum@linux.dev>, Viresh Kumar
 <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250331183935.1880097-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250331183935.1880097-2-thorsten.blum@linux.dev>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E8DDD44331
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	RBL_SENDERSCORE_REPUT_6(1.00)[209.85.210.46:from];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.46:from];
	BAD_REP_POLICIES(0.10)[];
	R_SPF_ALLOW(0.00)[+ip4:209.85.128.0/17];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ieee.org,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	R_DKIM_ALLOW(0.00)[ieee.org:s=google];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 23XWB7H7U47XIHBJA3ZUCF3DUCDBLTXU
X-Message-ID-Hash: 23XWB7H7U47XIHBJA3ZUCF3DUCDBLTXU
X-Mailman-Approved-At: Tue, 01 Apr 2025 00:01:32 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Remove unnecessary NUL-termination checks
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/23XWB7H7U47XIHBJA3ZUCF3DUCDBLTXU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/31/25 1:39 PM, Thorsten Blum wrote:
> Commit 18f44de63f88 ("staging: greybus: change strncpy() to
> strscpy_pad()") didn't remove the now unnecessary NUL-termination
> checks. Unlike strncpy(), strscpy_pad() guarantees that the destination
> buffer is NUL-terminated, making the checks obsolete. Remove them.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

This looks good!  Although the NUL-termination check isn't
needed, it isn't safe to ignore the return value of strscpy_pad().
More below.

In all cases, it looks like strscpy_pad() (and not just strscpy())
is the correct thing to call, because the pad bytes are passed
either to user space, or supplied as part of a Greybus request
message.

> ---
>   drivers/staging/greybus/fw-management.c | 39 +------------------------
>   1 file changed, 1 insertion(+), 38 deletions(-)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index a47385175582..852c0830261f 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -125,16 +125,6 @@ static int fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
>   
>   	strscpy_pad(fw_info->firmware_tag, response.firmware_tag);
>   
> -	/*
> -	 * The firmware-tag should be NULL terminated, otherwise throw error but
> -	 * don't fail.
> -	 */
> -	if (fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
> -		dev_err(fw_mgmt->parent,
> -			"fw-version: firmware-tag is not NULL terminated\n");
> -		fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] = '\0';
> -	}

Interesting this didn't return an error, while others below did.

The sizes of the arrays passed to strscpy_pad() are not necessarily
the same, so you should check for its return value.
fw_info->firmware_tag is GB_FIRMWARE_U_TAG_MAX_SIZE=10 bytes
response.firmware_tag is GB_FIRMWARE_TAG_MAX_SIZE=10 bytes also,
but these could theoretically change independently.

> -
>   	return 0;
>   }
>   
> @@ -154,15 +144,6 @@ static int fw_mgmt_load_and_validate_operation(struct fw_mgmt *fw_mgmt,
>   	request.load_method = load_method;
>   	strscpy_pad(request.firmware_tag, tag);
>   

Here the maximum length of the tag is GB_FIRMWARE_U_TAG_MAX_SIZE
bytes, and it may or may not be NUL-terminated.  The size of
request.firmware_tag is GB_FIRMWARE_TAG_MAX_SIZE.  Again you
can't be sure they're the same, and even if they are, the source
could be truncated.

> -	/*
> -	 * The firmware-tag should be NULL terminated, otherwise throw error and
> -	 * fail.
> -	 */
> -	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
> -		dev_err(fw_mgmt->parent, "load-and-validate: firmware-tag is not NULL terminated\n");
> -		return -EINVAL;
> -	}
> -
>   	/* Allocate ids from 1 to 255 (u8-max), 0 is an invalid id */
>   	ret = ida_alloc_range(&fw_mgmt->id_map, 1, 255, GFP_KERNEL);
>   	if (ret < 0) {
> @@ -250,15 +231,6 @@ static int fw_mgmt_backend_fw_version_operation(struct fw_mgmt *fw_mgmt,
>   
>   	strscpy_pad(request.firmware_tag, fw_info->firmware_tag);
>   

The size of request.firmware_tag is GB_FIRMWARE_TAG_MAX_SIZE bytes.
The size of fw_info->firmware_tag is GB_FIRMWARE_U_TAG_MAX_SIZE bytes.
Check the return value for -E2BIG.

> -	/*
> -	 * The firmware-tag should be NULL terminated, otherwise throw error and
> -	 * fail.
> -	 */
> -	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
> -		dev_err(fw_mgmt->parent, "backend-version: firmware-tag is not NULL terminated\n");
> -		return -EINVAL;
> -	}
> -
>   	ret = gb_operation_sync(connection,
>   				GB_FW_MGMT_TYPE_BACKEND_FW_VERSION, &request,
>   				sizeof(request), &response, sizeof(response));
> @@ -301,16 +273,7 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
>   	struct gb_fw_mgmt_backend_fw_update_request request;
>   	int ret;
>   
> -	ret = strscpy_pad(request.firmware_tag, tag);
> -
> -	/*
> -	 * The firmware-tag should be NULL terminated, otherwise throw error and
> -	 * fail.
> -	 */
> -	if (ret == -E2BIG) {
> -		dev_err(fw_mgmt->parent, "backend-update: firmware-tag is not NULL terminated\n");
> -		return -EINVAL;
> -	}
> +	strscpy_pad(request.firmware_tag, tag);

The size of request.firmware_tag is GB_FIRMWARE_TAG_MAX_SIZE bytes.
The maximum size of tag is GB_FIRMWARE_U_TAG_MAX_SIZE bytes, and it
may or may not be NUL-terminated.  So this case should stay as-is,
and check for -E2BIG.

					-Alex

>   	/* Allocate ids from 1 to 255 (u8-max), 0 is an invalid id */
>   	ret = ida_alloc_range(&fw_mgmt->id_map, 1, 255, GFP_KERNEL);

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
