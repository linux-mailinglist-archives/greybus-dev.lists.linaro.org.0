Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B0089A9F6D1
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Apr 2025 19:06:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BC3A7450C1
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Apr 2025 17:06:55 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	by lists.linaro.org (Postfix) with ESMTPS id 3BD7D410BC
	for <greybus-dev@lists.linaro.org>; Mon, 28 Apr 2025 17:06:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=OsSEVkrD;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.46 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so26315075e9.2
        for <greybus-dev@lists.linaro.org>; Mon, 28 Apr 2025 10:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745860009; x=1746464809; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ttAPR2nnzr3O+nZdkkXAqM5OCqtTBjn7C3XdJ2LYctM=;
        b=OsSEVkrD0o3zDKZRmowVzu05actdBcDbTu8kI8CSdDpP1ehn2qtJfxg5UMdEldT1SY
         NCXP1BYqxgKUPSIhZmHACKxoINWNf3u4HTkXvOr4GjHdFpEiprDHBV6/K+RKhJqaz4+h
         yCFUwQTejK1Uqyw6VO2SDRdncgAa0WqTbl7LQu5GeAVDhDO5vMcJSZX2t6HaV3JlSXlu
         pWDR4pU3iAMhGHZzk8OeeFE5ftblfs53ENpXXd1KOjSW0oVx6j4SH30EPsJOkZy/TxxQ
         OSXqi3Q37bcS9J3Rfk2AcLTGOgQeN9U0ANTYOPXg3u7Jj0f1iCZHI3RI2ttUfJkhxtxS
         S7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745860009; x=1746464809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttAPR2nnzr3O+nZdkkXAqM5OCqtTBjn7C3XdJ2LYctM=;
        b=RBLBNNmK0wgT8yGo49it8YjI6R582KI2mn61xEpQhWVO9Lzn2IPbDeFtodvedpZpOB
         pVxJ/crZULZpgBLK0e0lcM9D4eZ/WYNXCRJLqlPA0ivmE+QmPDw+i4Q40J8PiMhek5LP
         YNyIZIw3A9m0nkfpssH+vvMtaecXmZTWYe/XrmayuacD03QFVpYAeaNCkbGjFfKwA37a
         FORxBudosfFesOaZG5DJSx5Yci1gkDV+biZ4uf/rQqjrLDOluTqseq+02RNgfKyZGzh5
         HdL5sqgAZ6Ki2bCnhSZhuFTGDn4nuMdggTh5ILMgfB6gZeh7Sb7u9gVIKVIuku0qCEet
         9hrg==
X-Forwarded-Encrypted: i=1; AJvYcCV1NWwbDLH8C2fBUoBvnrPXnCE/qNn8vpSqOQZ4uZ4FLmSY9IjKGIboY1L06ybghshqWd/FmbNXFVoaYA==@lists.linaro.org
X-Gm-Message-State: AOJu0YzBl8SwVd6ZavwlmUNAKftzBbLYn+gZLhtrosvF+2H0bf6U9M1n
	bb18rQdJ7s5ih9jQ845xj366pJy7zZiflfe5wDF5QZSMx+uGd4b0V1SDBcq1wXtykA==
X-Gm-Gg: ASbGnct6iZaHSUEGNyZfBR8SpCNHjWkNohX6WFjqBiPKThbyh9p5jNl9Jkdjkt9nB5Z
	93M4vfxgBUP+gr4pJaDMrB76N1uTJI5TGPhUmvccca8CQnYUNptty/Vv7ILikT/DuxIzTwe6gwh
	Oyg03M1oBxdFQgIIhm5jvdF3ocQuS7xSwHVewbDRBWMQK2i3/PcDRr4mtLlt2A8RqIpXuvqppdK
	UhE5mc/D4dkooz7cOyuHa3ghHazYl/eoUTO3TtMIEMoetpjoZECAhxPX1/VVkLMrhZa3GoUcgOd
	oNlrnnnWCk/QJKakK0vMeEOa6YnKfPBmvMRsu8VRoG8MEg==
X-Google-Smtp-Source: AGHT+IFFtsUvOru4VFXTbio9Ytb7+BeHGQ/bBHpgQLhDKt8Mul1sfm/jNtuzIXtCpsCi5L7CbjPfDA==
X-Received: by 2002:a05:600c:1d97:b0:440:67f8:7589 with SMTP id 5b1f17b1804b1-440a66143f0mr133682935e9.16.1745860009202;
        Mon, 28 Apr 2025 10:06:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4409d2dfc2fsm160453095e9.33.2025.04.28.10.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:06:48 -0700 (PDT)
Date: Mon, 28 Apr 2025 20:06:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sridhar Arra <sridhar.arra@yahoo.com>
Message-ID: <01975294-1073-4263-a201-0f68781fbb6a@stanley.mountain>
References: <20250428160837.664000-1-sridhar.arra.ref@yahoo.com>
 <20250428160837.664000-1-sridhar.arra@yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250428160837.664000-1-sridhar.arra@yahoo.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3BD7D410BC
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.128.46:from];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.46:from];
	FREEMAIL_TO(0.00)[yahoo.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DNSWL_BLOCKED(0.00)[209.85.128.46:from,196.207.164.177:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: 6YV6IYY5EHXGDDE2JBIFDOXVVFHXV3PV
X-Message-ID-Hash: 6YV6IYY5EHXGDDE2JBIFDOXVVFHXV3PV
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/2] [PATCH v2 1/2] staging: greybus: fw-management: Add detailed mutex comment
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6YV6IYY5EHXGDDE2JBIFDOXVVFHXV3PV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 28, 2025 at 09:38:36PM +0530, Sridhar Arra wrote:
> Added a detailed comment explaining the role of the mutex
> in serializing firmware management ioctl() operations.
> The mutex prevents concurrent access to firmware operations
> and protects the 'disabled' state flag during disconnection.
> 
> Signed-off-by: Sridhar Arra <sridhar.arra@yahoo.com>
> ---
>  drivers/staging/greybus/fw-management.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index a47385175582..56725b711a17 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -28,6 +28,19 @@ struct fw_mgmt {
>  
>  	/* Common id-map for interface and backend firmware requests */
>  	struct ida		id_map;
> +	/*
> +	 * Mutex to serialize firmware management ioctl() operations and
> +	 * protect against concurrent access.

"serialize" and "protect against concurrent access" are the same thing.

> +	 *
> +	 * Ensures that user-space cannot perform multiple firmware
> +	 * operations in parallel (e.g., updating interface firmware)

"Ensures that user-space cannot perform multiple firmware operations in
parallel" also is the same as serializing.

What does "updating interface firmware" mean in this context?  It's
not really even true...  There are other places poking at the firmware
that don't take the lock (so this lock on it's own doesn't ensure that).

> +	 * for the same Interface, avoiding race conditions and reducing
> +	 * code complexity.

"avoiding race conditions" also means serialize.  It doesn't "reduce
code complexity".

> +	 *
> +	 * Also protects the 'disabled' state flag, preventing new
> +	 * operations from starting when the firmware management
> +	 * connection is being disconnected.

Yep.  That's true.

I guess (from reading the code without much background) that we can
use the fw_mgmt_ioctl() to set some configuration options until
the FW_MGMT_IOC_MODE_SWITCH ioctl is called.  So this lock enforces
those rules.  You can only call fw_mgmt_ioctl() one at time until
either FW_MGMT_IOC_MODE_SWITCH is done or we disconnect, which
ever is first.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
