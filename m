Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8235DA771A6
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 02:01:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9B80A46D68
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Apr 2025 00:01:47 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	by lists.linaro.org (Postfix) with ESMTPS id 0BC1B44331
	for <greybus-dev@lists.linaro.org>; Mon, 31 Mar 2025 23:49:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=riscstar-com.20230601.gappssmtp.com header.s=20230601 header.b=ubkiGjby;
	spf=pass (lists.linaro.org: domain of elder@riscstar.com designates 209.85.166.181 as permitted sender) smtp.mailfrom=elder@riscstar.com;
	dmarc=none
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3ce868498d3so19743055ab.3
        for <greybus-dev@lists.linaro.org>; Mon, 31 Mar 2025 16:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743464992; x=1744069792; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rDbOavufpFo26W+Zku5x0VpH9Cvbcrt9SziwHnr6lV4=;
        b=ubkiGjbyiXu0YNqO1N9otSyfyHK8LGFj4z3J5h+jdyPHwQIkW9UkJcfJ8nppIkpFXD
         /tyNc/bxzxt5R3m7jQ0K75kjMRcg8+AWNV9NDfTTim35R2QIpKN8GTShW8VAyB/nqTfR
         aM644CYsZ6NSe72UXB7WGxmOKsMRH7EUrXFeFn60c5mOmiRzP8iZfcbR7PIr8vOMt++6
         LLkie8dPS+ri073s4S7ytDQ/D0uhB6IU3F9yVvAN8S3CNqqir4kGOTpFpPQLbVEJ7Ohy
         BIK5SUFxJnEt22NaiP7XUabt0t6P0sm7qH866LBl2vS/LfjiZVdabOylUPxIE2vqM36V
         m1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743464992; x=1744069792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDbOavufpFo26W+Zku5x0VpH9Cvbcrt9SziwHnr6lV4=;
        b=IfdXh/lNMkU0nVuXn1GrAVoF/eA8aK33K1qYrOe1p7J+DZBONt+PEpfpuOX9yRHgBO
         3Gfa3flbUs40aXgKNRcIPtM/LmP0byAXIgZzBnKqpA40MYQtEGPKXnzHAnlhiPTzXzLD
         /wUOWkgpsSma4HX9q59APw0a/q5d0tiwni6ZzHDHMvelDgc2fCClLFbHjXjKfVK3pNsO
         qsQ1INo195XhaAKp96ogkqDiDJaj3QYEg1W6dg6IyO+7F3QjPqzH2NQfKrToqQIpFa+n
         0WnykYwk9Ws9cz65/PRrUEapU6j1EeZtnomQKLHXJvfE4Aiir58o8d3v2K4E6XwlyQL1
         rMYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXgNZPT9gtHJEEthh5Y2w+dUjuBT53cfmy7HeV+8acPw4bAEPJUM1AH14ZucZ2UDPxM4B0rAN50is5Yg==@lists.linaro.org
X-Gm-Message-State: AOJu0Yzy0wKBh9P3zT2FZFXbFaNS1/SCaYqQ85WM7KWjAO7XTELd2s4X
	n9t5ghwDkvtZyHeHrDWwJfqb9GgthTYbQrlTcIRhOrB9RtqcajIAj8aIjKKxO50=
X-Gm-Gg: ASbGnct4/vxMDI/1zKnihGmkK2DeMjsJvyXvd6hqZT8su973M9v1RveiMdufrlCfzgN
	mfxGIepQdtQSRNaarhglvqhWqnXTLU7pcWO3zP4ZkStR8xUyQAB3fQARxoXMbyIPcaV3Pq7I4WB
	bH5/2QmY6pvo7Kps9QafMOxeTPyyTm6e8JAHIji+Corp5CtTcrdBLrAI4KHPISsaUQ6/M/4gj74
	STgtdDxOFY73IwnxAq0GvjpaD681TCUAJ3jrRm3JP3KAA6f9/yQH3b+RpXKdGluHMXNvNhiCojB
	GEDLx5Np5cfRMO3m6JV5B7nuWQynUrCZTId15BsCSZZU3XllyvCzGepefnwwGrLqJ45wNsvsMQb
	Syk/lYdiX
X-Google-Smtp-Source: AGHT+IGS7o7rVQuhHRDL3VF0MNhBcsgv7O47l22zBrXWo8Fko9huCk4BOt5GOeICjubR5V7NnIFH4A==
X-Received: by 2002:a05:6e02:3387:b0:3d0:443d:a5c3 with SMTP id e9e14a558f8ab-3d5e08f0fd1mr125285725ab.3.1743464992484;
        Mon, 31 Mar 2025 16:49:52 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f464871f77sm2140194173.77.2025.03.31.16.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 16:49:52 -0700 (PDT)
Message-ID: <d683962c-e8b7-4adc-9902-483976197637@riscstar.com>
Date: Mon, 31 Mar 2025 18:49:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: gpittala <ganeshkpittala@gmail.com>, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
References: <20250331213337.6171-1-ganeshkpittala@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250331213337.6171-1-ganeshkpittala@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0BC1B44331
X-Spamd-Bar: -
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,nexus-software.ie,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[riscstar.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[riscstar-com.20230601.gappssmtp.com:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.166.181:from];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.181:from];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: elder@riscstar.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: CEBAW2GHKXLHEGI75RAY6ZL5MKGKJFK3
X-Message-ID-Hash: CEBAW2GHKXLHEGI75RAY6ZL5MKGKJFK3
X-Mailman-Approved-At: Tue, 01 Apr 2025 00:01:33 +0000
CC: hvaibhav.linux@gmail.com, pure.logic@nexus-software.ie, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Multiple cleanups and refactors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CEBAW2GHKXLHEGI75RAY6ZL5MKGKJFK3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/31/25 4:33 PM, gpittala wrote:
> This patch includes multiple meaningful cleanups for the Greybus staging driver:
> 
> 1. firmware.c: Replaced deprecated 'strncpy()' with 'strscpy()'

This is a good type of change to make.

> 2. sysfs show functions: Replaced 'sprintf()' with 'sysfs_emit()'

This is also an improvement.

> 3. loopback.c: Refactored a large function (gp_loopback_fn) to improve readability

I have only glanced at this, but refactoring something can
sometimes be clearer if you do it in several small patches.

> 4. audio_gb.c: Split logic in get_topology() into separate calls as per TODO

I'll comment more below, but you should almost always have
only one change per patch.  So each of the four items listed
above deserves its own patch.  You could send them separately
(because they're unrelated), or as a series of cleanups.

Note that "one change per patch" is a logical (not literal)
statement.  For example, you could do a single patch that
replaces *all* calls to strncpy() with strcspy().

> All changes are tested and pass checkpatch.pl
> 
> Signed-off-by: gpittala <ganeshkpittala@gmail.com>
> ---
>   .../greybus/Documentation/firmware/firmware.c |  32 ++--
>   drivers/staging/greybus/arche-apb-ctrl.c      |  11 +-
>   drivers/staging/greybus/arche-platform.c      |  11 +-
>   drivers/staging/greybus/audio_gb.c            |  37 +++-
>   .../staging/greybus/audio_manager_module.c    |  13 +-
>   drivers/staging/greybus/gbphy.c               |   3 +-
>   drivers/staging/greybus/light.c               |   5 +-
>   drivers/staging/greybus/loopback.c            | 170 ++++++++++--------
>   8 files changed, 159 insertions(+), 123 deletions(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
> index 765d69faa9cc..8e375c88c881 100644
> --- a/drivers/staging/greybus/Documentation/firmware/firmware.c
> +++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
> @@ -47,12 +47,12 @@ static int update_intf_firmware(int fd)
>   	ret = ioctl(fd, FW_MGMT_IOC_GET_INTF_FW, &intf_fw_info);
>   	if (ret < 0) {
>   		printf("Failed to get interface firmware version: %s (%d)\n",
> -			fwdev, ret);
> +		       fwdev, ret);

The two changes in this hunk are not mentioned in the
description above.  Please remove these changes.  If
you want to do reformatting like this, do it in a
separate patch.

While it might be reasonable to include a little white
space change like this occasionally, you should avoid
doing it.  It is unrelated, and complicates your patch
unnecessarily.

This comment applies to several other changes you've
made below.  It also applies to removal (or addition) of
blank lines, or really, any other white space changes.

					-Alex

>   		return -1;
>   	}
>   
>   	printf("Interface Firmware tag (%s), major (%d), minor (%d)\n",
> -		intf_fw_info.firmware_tag, intf_fw_info.major,
> +	       intf_fw_info.firmware_tag, intf_fw_info.major,
>   		intf_fw_info.minor);
>   
>   	/* Try Interface Firmware load over Unipro */
. . .
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
