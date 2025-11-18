Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A04B0C696F9
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 13:39:49 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BD4E43F95E
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 12:39:48 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	by lists.linaro.org (Postfix) with ESMTPS id 370B13F81E
	for <greybus-dev@lists.linaro.org>; Tue, 18 Nov 2025 04:04:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=f5GdZTW9;
	spf=pass (lists.linaro.org: domain of abdun.nihaal@gmail.com designates 209.85.214.178 as permitted sender) smtp.mailfrom=abdun.nihaal@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-297f35be2ffso71029585ad.2
        for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 20:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763438682; x=1764043482; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wC+feY3qzBWI5faUCV3T2V3Iz0yHnRlIALjZtVQOaPI=;
        b=f5GdZTW9ImCDtJzJ7BxiejxXjwCYoKYONgaAtLY5fIyzhV4x6UWbYkID0Sd02uL/2h
         5mOqhqFJJXyTZa7DPCrIkygQxqTRcVr/cKLCy9oEQFroxXT/ifLL7vcAf56Cjb7dFCFm
         EnQYsi94gTAz7paXyUJTzscOnIlZNKnGZBi9wH/aRJo0ciQkevLHqGfNaXKAQoQWH6HK
         PY5nQGFCKg/wXKqzA0hetQAaLTqttTDLhNBFpbDBXaJZHR22ckxaxBB7lVgKSxW3WXHm
         G96wI6NNvo9F9lJLy9p1IACVxDq3oewBMGDVo7EZH+wRkUHvqdx/cbHQreHWG8pZq9PD
         gtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763438682; x=1764043482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wC+feY3qzBWI5faUCV3T2V3Iz0yHnRlIALjZtVQOaPI=;
        b=eC5M8CnIF8G0X6YkEdDhwI0nRSKeUnaRpLcGu6r9SbuN5+Q4pt0wFvJrbgKvdrc34M
         /CdD4Qe36W69vitqhvIobnLqYsp49A83fFfwonoLK3wsMzjSXDjDIMjQWjkMXVNCKlVM
         TsWB4+murNpKI3FMf/uH1f3tWbnTi0ISne9Yeq8OfQiIWLQO2kwQosjcxfBdWsKcJFeS
         r/V53Ozi19cGjFUidC396wEtX3O0exGQG4a0YGsPe5kgJ/cUZc88cyMrPeE6aYEu1Ld4
         Gmii307QYtlXVyvVKgNZEOlGpZ8dyIFfVyrQwUmCU8gYGBOB2uwZ+0L4RMLdkkhRc0Xq
         StfA==
X-Forwarded-Encrypted: i=1; AJvYcCXMxRrOV+iCp4p20GTXG4uZpk6RctLr0ZlOWwg+FmNFW5awu2X6BP2mtwqYKBXsAMrIK69Ln5T+IzrN9Q==@lists.linaro.org
X-Gm-Message-State: AOJu0Yw51G5+lN1AjO1xBuwAT6upGsTvgnpcQLpHoSaX21Su+Rl1ZKvo
	RAZy4bgkBRAZRhLoVCN3Pyk4ufxPMK2wBT7N8iZ0RPVKdD8ZZnPFRv3N
X-Gm-Gg: ASbGncsUqnm9126uXDPn65F17fAXgwMh3dgtYOuA48GxPIZlbWP2sK+4CIFpK1G2HVW
	uzsoY8Q5zGJA/H4+ioVRG8jfBk/itdqLztqVMRqF/WP50UONxkVTUgauIh74KE0EfV0oC8Z09aX
	z0nox/li9ZiHh1VO54HXip/GaJFAPNUhVSOy3D5JMhC7xxXSuH/Z4GWikTXAw65ZZdQmA8NEVV1
	0Ma6IdudlKA4G+XJKgY4fN8vgX4+qhdG6x18md0mYEnHbUwjhu8cUt8AXhFVtZTeARgmDeimzix
	XB62Wh6R8orQn8RkbeY8/SffTJAILJOBb7DDf/bgGOQjb1ugfsr48gksX+n9yJpN+Z7fg1PTAHd
	6A8BtOV1pGwk0Nt6J1DURpFxM1OKGiKmcMScot1zqJgaOuV/+V7nuPa3RFNacYFxJqcLDdHBgab
	bikpVup/9TV6hK7Q==
X-Google-Smtp-Source: AGHT+IFT545HL7cW2e25KJt+R06w8oqszsIxfb4dxlMAMz1NI+ZeTUu09LQHTiYeM6nZQjKUC69tBA==
X-Received: by 2002:a17:903:24f:b0:290:c94b:8381 with SMTP id d9443c01a7336-2986a6bc29fmr167104235ad.7.1763438682255;
        Mon, 17 Nov 2025 20:04:42 -0800 (PST)
Received: from essd ([49.37.219.248])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36f42eb0esm13669955a12.13.2025.11.17.20.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 20:04:41 -0800 (PST)
Date: Tue, 18 Nov 2025 09:34:35 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Message-ID: <amtyeav3zlevbv5yq5izi3acoezndxijz7p5mf5vngng57sdvu@2fms574jooks>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
 <20251117181818.118139-11-ayaanmirzabaig85@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117181818.118139-11-ayaanmirzabaig85@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.178:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 370B13F81E
X-Spamd-Bar: ---
X-MailFrom: abdun.nihaal@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: H763OOR6U6LUXPEE3GY44RJSEAYHHDU2
X-Message-ID-Hash: H763OOR6U6LUXPEE3GY44RJSEAYHHDU2
X-Mailman-Approved-At: Tue, 18 Nov 2025 12:38:57 +0000
CC: johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 10/13] staging: greybus: raw: handle disconnect while chardev is open
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/H763OOR6U6LUXPEE3GY44RJSEAYHHDU2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 17, 2025 at 11:48:15PM +0530, Ayaan Mirza Baig wrote:
> diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
> index 71de6776739c..74818ca829c2 100644
> --- a/drivers/staging/greybus/raw.c
> +++ b/drivers/staging/greybus/raw.c
> @@ -24,6 +24,7 @@ struct gb_raw {
>  	dev_t dev;
>  	struct cdev cdev;
>  	struct device *device;
> +	bool disconnected;
>  };
>  
>  struct raw_data {
> @@ -231,10 +232,14 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
>  	struct raw_data *raw_data;
>  	struct raw_data *temp;
>  
> -	// FIXME - handle removing a connection when the char device node is open.
> +	/* Mark device as disconnected so file operations fail gracefully */
> +	raw->disconnected = true;
> +
> +	/* Disable Greybus connection before destroying the chardev */
> +	gb_connection_disable(connection);
> +
>  	device_destroy(&raw_class, raw->dev);
>  	cdev_del(&raw->cdev);
> -	gb_connection_disable(connection);
>  	ida_free(&minors, MINOR(raw->dev));
>  	gb_connection_destroy(connection);

At the end of gb_raw_disconnect(), the raw structure is freed using
kfree, and so subsequent reads to raw->disconnected from other
entrypoints would be a use after free.

In addition to adding the disconnected flag which you have done, you
also have to convert raw to use reference counting, ensuring that the
raw structure is alive till the last file is closed. Please have a look
at drivers/staging/greybus/authentication.c where the same issue of
files being open during disconnection is handled for the gb_cap
structure in gb_cap_connection_exit() using reference counting.

Regards,
Nihaal
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
