Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EE77889D2D3
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Apr 2024 09:09:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D5C6C43FAD
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Apr 2024 07:09:29 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	by lists.linaro.org (Postfix) with ESMTPS id 278333F466
	for <greybus-dev@lists.linaro.org>; Tue,  9 Apr 2024 07:09:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b="tM/cW4wG";
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.208.47 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so6452735a12.1
        for <greybus-dev@lists.linaro.org>; Tue, 09 Apr 2024 00:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712646566; x=1713251366; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0dqFx7OAEEc14dAOlgSGXODmvAlEfmH4sG0q/z/Eh9I=;
        b=tM/cW4wG9pzXx8lls4PiMB0GFBMjvCDL0cqpWkH5PlvkIuSsFu8x51sRa++cfTuTKr
         MPv2lQUGnPK1RCQ6FLc9JCa7NqLBRcZHiAU8wyskHspH6klhMxMTbwDIt85AnoCFbP/8
         jRQDd18Ik1isYR4k4qf8dQf3qwQ4aSTwjiRa3nT0M1t06G0CoNkrmubO7cqPS09ccvJB
         Qly+kXDsd/s6b8V9m6Ihz0lDpc1ztZzAlkGSzBHDwSta+DJ+cOqxLY9a7kam1U1AcDu0
         AUIrPpFZ/PBv4ER9yM+80kCpEiMyjSsOvTT7P1nFyRQ+yzgXhJFYvUDddCvzW0LDMApD
         Zygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712646566; x=1713251366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dqFx7OAEEc14dAOlgSGXODmvAlEfmH4sG0q/z/Eh9I=;
        b=s4XIdvfyibkXnP4+doR3M6cQ1u02XHKoyWOa8HNmW3dXQpS2gV6CWb7XXRZ7iX818D
         6BFFAU4GrFEwQLjPPJEQJoGxeTbXCs60vXZsi2tb+01CSUPntI4+9X51ppFGlVkQ8uUF
         VZvALVfvhS0hthCFP+NDSfklyslYqCVWCZ+VvT6LVNIhPw3Af/+ttvaNyalKc1ePH3n/
         6o8LKCORlwW6ePCvT+AB7SybaIgEm1xu5z3HJ7ElViATwU0UQxqbgN3gB13VvFl6En3X
         3VEqOOZ0NoSEK1GdlV6jd5qUzU+lgBsOITMie79tv0ZXBLZ1Jv+5l4vCuNgtlmUfmC/S
         26Yw==
X-Forwarded-Encrypted: i=1; AJvYcCX9d4Jp3fq/HyIGng3gQKuHiFw/BH98pH/Q1L3oe3ilrN+5FiRFO7jXUNNwve9VtZ60d0EfRP+EIEV9kBGTzHxOayaKfhSdpK2zwnJJ
X-Gm-Message-State: AOJu0YyNPYTGNzF+INwXxDLI0nekq5fTgjryxNKPGljq7M7Iwz4+isA8
	luyrOOfqXDHJT1LXjV4iz/uzB6jhfTV06k9CdF+WMruiss9l6bVjRlU7GIi/paQqAg==
X-Google-Smtp-Source: AGHT+IF8ASg7kMbnXwHDeqwXy3LQ3xUTvoyu/Kg40aJzVJoigndfnNloGnbO9W76N9qNqCXlOfTaTA==
X-Received: by 2002:a50:aad0:0:b0:56e:32af:c527 with SMTP id r16-20020a50aad0000000b0056e32afc527mr4639177edc.20.1712646565942;
        Tue, 09 Apr 2024 00:09:25 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bf20-20020a0564021a5400b0056dd3626035sm4832490edb.91.2024.04.09.00.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 00:09:25 -0700 (PDT)
Date: Tue, 9 Apr 2024 10:09:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>, Alex Elder <elder@kernel.org>
Message-ID: <3bdbb7aa-d9b4-40ec-836b-ae5978cda9e0@moroto.mountain>
References: <20240328140512.4148825-1-arnd@kernel.org>
 <20240328140512.4148825-11-arnd@kernel.org>
 <76214105-94ae-4540-8511-e9e2ff6d257e@moroto.mountain>
 <1622d9ff-feed-4a12-9d8d-3f00088c9edf@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622d9ff-feed-4a12-9d8d-3f00088c9edf@app.fastmail.com>
X-Rspamd-Queue-Id: 278333F466
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.47:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linuxfoundation.org,arndb.de,wanadoo.fr,lists.linaro.org,lists.linux.dev];
	URIBL_BLOCKED(0.00)[linaro.org:dkim,arndb.de:email];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: DVZW2VU7S3OCITVXFWXALYOA3LHXBVTZ
X-Message-ID-Hash: DVZW2VU7S3OCITVXFWXALYOA3LHXBVTZ
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 10/11] staging: greybus: change strncpy() to strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DVZW2VU7S3OCITVXFWXALYOA3LHXBVTZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 08, 2024 at 08:26:00PM +0200, Arnd Bergmann wrote:
> On Thu, Mar 28, 2024, at 16:00, Dan Carpenter wrote:
> > On Thu, Mar 28, 2024 at 03:04:54PM +0100, Arnd Bergmann wrote:
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >> ---
> >> This is from randconfig testing with random gcc versions, a .config to
> >> reproduce is at https://pastebin.com/r13yezkU
> >> ---
> >>  drivers/staging/greybus/fw-management.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> >> index 3054f084d777..35bfdd5f32d2 100644
> >> --- a/drivers/staging/greybus/fw-management.c
> >> +++ b/drivers/staging/greybus/fw-management.c
> >> @@ -303,13 +303,13 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
> >>  	struct gb_fw_mgmt_backend_fw_update_request request;
> >>  	int ret;
> >>  
> >> -	strncpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
> >> +	ret = strscpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
> >
> > This needs to be strscpy_pad() or it risks an information leak.
> 
> Right, I think I misread the code thinking that the strncpy()
> destination was user provided, but I see now that this copy is
> from user-provided data into the stack, so the padding is indeed
> stale stack data.
> 
> I could not find out whether this gets copied back to userspace,
> but adding the padding is safer indeed.
> 

Grey bus is a bus, I'm not sure what's on the other end of the bus but
I think we've generally said that the data needs to be zeroed...
Although if that is true, why didn't I make this a Smatch warning?

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
