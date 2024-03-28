Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA72890E80
	for <lists+greybus-dev@lfdr.de>; Fri, 29 Mar 2024 00:28:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9BE2844382
	for <lists+greybus-dev@lfdr.de>; Thu, 28 Mar 2024 23:28:49 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	by lists.linaro.org (Postfix) with ESMTPS id 85D6C44248
	for <greybus-dev@lists.linaro.org>; Thu, 28 Mar 2024 23:28:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=google.com header.s=20230601 header.b=hFvMKg3K;
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (lists.linaro.org: domain of justinstitt@google.com designates 209.85.166.41 as permitted sender) smtp.mailfrom=justinstitt@google.com
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7cc01644f51so70159939f.2
        for <greybus-dev@lists.linaro.org>; Thu, 28 Mar 2024 16:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711668527; x=1712273327; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rgK/m0H462r5jl378Ykwjg1mm44w08HwGWoGWcoQbgE=;
        b=hFvMKg3KPs223Q3FAnLkrZ2dxXo0y7Fi1M04X/kSLDWPstqjNmREcgUdtGtziv8Nzk
         6Qhs+5zuO1+gM+1WiFMfgUDKGNuKOgJsbCTaDRUda0vNRYCbtBEFVpLZrWp719CBy9IZ
         wYnMEzOAx5cg4aiLyj/wYJRCdCa4gEBwTMWI5FYmUh9aCBVibAvYdXw/IK5++NA6aFNJ
         +JEqnTELvviLsQtaIZhvh4DE2L5GH1L2o/ZZQfGNqcHispyWc595JB0ithG1JGtBOC1+
         DSp68daR4Zg+V9cX6KAVkc/y+8lzhBusQJ7YocS/um3hp4Q2AtbyUljVxRGpuJpT1V2V
         cz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711668527; x=1712273327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgK/m0H462r5jl378Ykwjg1mm44w08HwGWoGWcoQbgE=;
        b=qwElkdzoy2HK8kTT64jeYktetN2veFp2bbKy2/SzirHR+dIUIU+TlbQKpOEJoBfijG
         HLMfB1likcebvaXvNJ5vexg40r65y47BgNXkLnzThlgpNduvwD6F6X25XM83JvFQq2Jt
         MIpFzQocw2QndAAIAIhGOP1izXIz3HWMaeajANliF+H4PhUtpAj3AtbhGC0KMb8MAxIA
         Ugsv3w/ul9+lFk1N49MNaESYuRXKlsA/WvKwaLHgfFSDGrM0Cm+fnF4OQR/Z0g+kyM6N
         G8WcGEiRXxUBHQUylOfpx1WtSBuZA0cdLb28zJqgvMw3EvZgUjtifrzctIgyjD1/DFK5
         /IVw==
X-Forwarded-Encrypted: i=1; AJvYcCWrWWw5Ga/l56vjD3LUQrms6EWiZUscsAVaiW6bRc2e0Ht8xeUY2ZptG7/j9xR/s5i/rpv6q9iul7h1BJumrp3WpO5ri3Oa1nbTXlHP
X-Gm-Message-State: AOJu0YxmtB3KVYD/1+FkhVYGpoJL6oiv+wBNyUuUjTNk62x2TJyu818d
	dqCxOY+zCDteYV/245vy08jBm3yenrD8PiVYwzfAo2HBKIw8BzNLQ+BhJc17/A==
X-Google-Smtp-Source: AGHT+IGs2igEEehahi3XCvRqfhCt+CMMDEaFPcvv5gQgFXaivHDXEVbAns5XERYqvjB1h1K1XUCPqg==
X-Received: by 2002:a5e:920a:0:b0:7d0:8536:42f9 with SMTP id y10-20020a5e920a000000b007d0853642f9mr727107iop.6.1711668526876;
        Thu, 28 Mar 2024 16:28:46 -0700 (PDT)
Received: from google.com (30.64.135.34.bc.googleusercontent.com. [34.135.64.30])
        by smtp.gmail.com with ESMTPSA id y24-20020a6be518000000b007d08e86d43esm608938ioc.0.2024.03.28.16.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 16:28:46 -0700 (PDT)
Date: Thu, 28 Mar 2024 23:28:43 +0000
From: Justin Stitt <justinstitt@google.com>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <uejqjxh3ntjdyziy3avisav7ghhb3s66iccfwchjkm534zy3ja@3kxet4bu2ck3>
References: <20240328140512.4148825-1-arnd@kernel.org>
 <20240328140512.4148825-11-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240328140512.4148825-11-arnd@kernel.org>
X-Rspamd-Queue-Id: 85D6C44248
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.41:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linuxfoundation.org,arndb.de,wanadoo.fr,lists.linaro.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: Y37AHL3OVYLOFD6RKILTQ7FNRQTJMQHW
X-Message-ID-Hash: Y37AHL3OVYLOFD6RKILTQ7FNRQTJMQHW
X-MailFrom: justinstitt@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 10/11] staging: greybus: change strncpy() to strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Y37AHL3OVYLOFD6RKILTQ7FNRQTJMQHW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On Thu, Mar 28, 2024 at 03:04:54PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-10 warns about a strncpy() that does not enforce zero-termination:
> 
> In file included from include/linux/string.h:369,
>                  from drivers/staging/greybus/fw-management.c:9:
> In function 'strncpy',
>     inlined from 'fw_mgmt_backend_fw_update_operation' at drivers/staging/greybus/fw-management.c:306:2:
> include/linux/fortify-string.h:108:30: error: '__builtin_strncpy' specified bound 10 equals destination size [-Werror=stringop-truncation]
>   108 | #define __underlying_strncpy __builtin_strncpy
>       |                              ^
> include/linux/fortify-string.h:187:9: note: in expansion of macro '__underlying_strncpy'
>   187 |  return __underlying_strncpy(p, q, size);
>       |         ^~~~~~~~~~~~~~~~~~~~
> 
> For some reason, I cannot reproduce this with gcc-9 or gcc-11, so I'm not
> sure what's going on. Changing it to strspy() avoids the warning. In this
> case the existing check for zero-termination would fail but can be replaced
> with an error check.
>
>
Arnd, I see 4 instances of strncpy() in this file. Could you clean them
all up at once which would help GREATLY towards:
https://github.com/KSPP/linux/issues/90

strncpy() is an often misued and misunderstood (and deprecated [1])
string API, let's get rid of that thing all together!

[1]: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> This is from randconfig testing with random gcc versions, a .config to
> reproduce is at https://pastebin.com/r13yezkU
> ---
>  drivers/staging/greybus/fw-management.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index 3054f084d777..35bfdd5f32d2 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -303,13 +303,13 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
>  	struct gb_fw_mgmt_backend_fw_update_request request;
>  	int ret;
>  
> -	strncpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
> +	ret = strscpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
>  
>  	/*
>  	 * The firmware-tag should be NULL terminated, otherwise throw error and
>  	 * fail.
>  	 */
> -	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
> +	if (ret == -E2BIG) {
>  		dev_err(fw_mgmt->parent, "backend-update: firmware-tag is not NULL terminated\n");
>  		return -EINVAL;
>  	}
> -- 
> 2.39.2
> 
Thanks
Justin
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
