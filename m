Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKydNrI4rGmFnAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 07 Mar 2026 15:39:46 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 655C922C338
	for <lists+greybus-dev@lfdr.de>; Sat, 07 Mar 2026 15:39:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7175A3F827
	for <lists+greybus-dev@lfdr.de>; Sat,  7 Mar 2026 14:39:45 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	by lists.linaro.org (Postfix) with ESMTPS id 973D83F75F
	for <greybus-dev@lists.linaro.org>; Sat,  7 Mar 2026 14:39:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=TkUXcLt8;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.208.48 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6610bd5f322so6384478a12.1
        for <greybus-dev@lists.linaro.org>; Sat, 07 Mar 2026 06:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772894381; x=1773499181; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hpCq+Q4/Fku+DsEBvJwO7OxmVZJajB6rcPiIWQF8jOw=;
        b=TkUXcLt8E9lSU71oZeYHPs8g4gNls40FyCnAPTF/pnvDyQGz/hU59bc0WCFSEHFfL+
         Gt6EaGRpTU7wgmkRPidEIm//urjkJZcdWP8+DVciyoOQpYWQXWwDb7bzAES4qx9h7zW3
         ifAKjQK2deCpuWruo8ZAMclmPb9jVe2pocr7jrZ+lxUtRzw9A5uDlDZSCeOGuWV/pyV0
         6UOsUT7CaYoks5GN6eJNJ2e3E1E5zU3MQwPCxCjVUwu7/FUP61NtiI4uSQnckeux1+PS
         Mw02s8QqvTwiz3obe31pgtiI1PSSvxVfDkQjsHKWGOYQZ2eYdeZqsMJRFmol20KFsHqR
         OhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772894381; x=1773499181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpCq+Q4/Fku+DsEBvJwO7OxmVZJajB6rcPiIWQF8jOw=;
        b=nPxUetXMDY2Y3dLL/EBFOgmpPJwM95hkyG4vtuiSo8rPu4x9lD7avwEoyb/7qhIG3H
         SFK4gbdd/RC1ySfvECAHbSGAE5l80klbmRc5JePdqAAHcbde41Za2qDHt0iWzhmj8F79
         RashRFvAO8T87AtkFqxvsLVAf308qyZH2a/gtTgEKCRuuxhG3E5knk+EMz2SnjL1zKcj
         dAbeL2qYEpraHanSNhC0OomIOqAX9mmERDDZSWIxuRkIvDFy0WLOu+yePLCvKsjLkjnt
         9HLh4mqWtc4fLztvQT81Xt73rXqe6agwABgzI61mmO7Gxd9MgkK62UDwWdSPJZzQtHgB
         5SDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4eD6ov5re8AKr0L32O+TvUpF6j46PPF7wHUU0hwbhNvGNwTNVKxDMHdFbKP2ntfQybNJD/hja7JbhSQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YyJUGoLS97Q31TGOgEQnWsi5qLKvhE09j9wOhrIZfZLR8EKJXH5
	EOsAAda9b50l5wFH2J2A0jV8iNrk83AsFhIApK+uOTfKeqQlwPFgvZ573AoWbvznmo5xKA==
X-Gm-Gg: ATEYQzywbnQU9LvWSsYez7XBIAiV8IlnFjWsrOE58qR52ijq8Gnny8Vk7W3CJPsanOQ
	FfMy/JFp6pEWkZPqiwKrVOSkQSUt+4GCOL2dWi3iaifGlmr4qhZfb+Iovo0bymAS0YvabuKIiqR
	XvEVLPGHSyrMKJpoXF7rAkw/IJGGAwiXDgPQWjLhZ+yhqwyrDA9bsRZgkeN2FfXNRPK4uz8ZfAY
	MtBDTj+LKftHoYnLqZ9C2ECljWv3M1o2iiD72/v9kSJPBhHpiq06X62+pUKp9uELRH67wDQr5L7
	D1ZsEPvbtsxZSHfAWXwBvNAqIHqFEYwgC6toAgBQQzW1LCiVPa0vccfBXKy6Jkuy++Rx4nOT7g6
	AbrtMZ59Fu0+sFIL7+jmf+Yz/itPz/WaZMEkVqjLgzxMaIKKJ5WU8kujgME8PO6CZmfVtaIGeWc
	xQ4dIPfwMR1ONnf0n/GkfPa5Mwmf+/
X-Received: by 2002:a05:6402:268c:b0:661:93ed:cebf with SMTP id 4fb4d7f45d1cf-6619d51a156mr3250392a12.25.1772894381431;
        Sat, 07 Mar 2026 06:39:41 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a55a660csm1248151a12.33.2026.03.07.06.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 06:39:40 -0800 (PST)
Date: Sat, 7 Mar 2026 17:39:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rachit Dhar <rchtdhr@gmail.com>
Message-ID: <aaw4qSHE8c_YE_mn@stanley.mountain>
References: <20260307140930.1732-1-rchtdhr@gmail.com>
 <20260307140930.1732-3-rchtdhr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260307140930.1732-3-rchtdhr@gmail.com>
X-Spamd-Bar: ---
Message-ID-Hash: AYUVD4AUCJ756PLSHPYBBCOLSDCSNSU5
X-Message-ID-Hash: AYUVD4AUCJ756PLSHPYBBCOLSDCSNSU5
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 2/2] staging: greybus: resolved checkpatch checks for light.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AYUVD4AUCJ756PLSHPYBBCOLSDCSNSU5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 655C922C338
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.857];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	DKIM_TRACE(0.00)[linaro.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,greybus-dev-bounces@lists.linaro.org];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,stanley.mountain:mid,checkpatch.pl:url,lists.linaro.org:rdns,lists.linaro.org:helo]
X-Rspamd-Action: no action

On Sat, Mar 07, 2026 at 02:09:25PM +0000, Rachit Dhar wrote:
> Added comments to mutex declarations, to resolve the associated checkpatch.pl checks:
> 
> CHECK: struct mutex definition without comment
> +       struct mutex                    lock;
> 
> CHECK: struct mutex definition without comment
> +       struct mutex            lights_lock;
> 
> Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>

These kinds of things require more than a two word explanation.  It
should probably be a paragraph.  But first do a proper review of the
locking.  When do we start needing to worry about concurrent accesses?
How is it accessed?  What would happen if the locking were not there?
Is the unregister sequence correct?

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
