Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFBSB745rGm/nAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 07 Mar 2026 15:44:14 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F22922C3AD
	for <lists+greybus-dev@lfdr.de>; Sat, 07 Mar 2026 15:44:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4CD163F91D
	for <lists+greybus-dev@lfdr.de>; Sat,  7 Mar 2026 14:44:12 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	by lists.linaro.org (Postfix) with ESMTPS id 3BD353F75F
	for <greybus-dev@lists.linaro.org>; Sat,  7 Mar 2026 14:44:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=vOkFpwXa;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.221.46 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso7394526f8f.3
        for <greybus-dev@lists.linaro.org>; Sat, 07 Mar 2026 06:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772894649; x=1773499449; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h0Woosv//31tm6oZiSnSnGD51f8ZcgGW6Us1yWUdGTI=;
        b=vOkFpwXa3kGRdlV29tMJLw+3I5c+hzQB5whoPMgxSroQ8ThYP1nUN1iQPgH11IFcr5
         kmjWWlj2lfMdR0Sfc7LGWhlsvOnAYBbBC+N8rQJqPAw+Qlizd8MSvMtTVrMkafTHcbI3
         j/NoboyJK/SukkPXwv/jfTNYcqX3IDu6S1XoO7xg1oUBPmsnU4XtqoY8FLQzR7ACDRvA
         qZNDXYUOSdZ9++ZvzdqsDRmMs3moIRmGswolRWiO27mMk4xxgYV5MaNe1tJLeHaibDCh
         7g34zCF/jCI9P3UVLGlCaUQeU93I/KUwlUz89mqxcuaQB+20yU17h7bq63mcE7bAQj9P
         Xnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772894649; x=1773499449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0Woosv//31tm6oZiSnSnGD51f8ZcgGW6Us1yWUdGTI=;
        b=bxMjcHBXhhiNJmQAeIQpehnucrRk7I7NannCgruLdR0tsxVINF/IhuRmzdx0JnIz1T
         DoJxpZ07RRHZBvgUEpDtxk15qhdynJr/SIJwgFMTcPIBz99K+u4yrBEMcOU9h8zzfVN4
         y5Pqi05usVUzx6685yfAanc3itQu/sA8GeHtuOFbb27CBYS2V4wOHLJrk17+akkFooke
         gYRVkmREjjF5abix2B7/L9yPAdZivWa9hTC1DJmxML65zfj33ziDULFzAFmroWZPpHiK
         LVMzPOzSlCR/6SLG6Xvrd0RAY2JTH57WL2HJqMSBRti6TWnZcM2Ctj2wLplj97YXUVtY
         OSdw==
X-Forwarded-Encrypted: i=1; AJvYcCWM87YgVYYuG3m741oD6qS6uIIY8DiGcAdqS1k2MMupT/c+/Y2mmShKy3nUSX9w/AAxjq8Q/VcPbI4KEg==@lists.linaro.org
X-Gm-Message-State: AOJu0YxHcl/0FPKCZED8A2ZSDs7Z1RAPVd48aaccMx3I5GU4W2rSTjvb
	KgtB6dREZovmtvPTsYdWzyrCo+wKe0sydcXYuuijxOWyDxdL8c9ns58UGyZIisAyidzQyw==
X-Gm-Gg: ATEYQzwoAk8Od4JZ6wQXRg/LL5bANI8RJWK6lL3959YoHT7GmRu3bDeZOT+egNFZfB0
	3a+GVJ71MIgN3zPeR6Gl23ki+y/y4x2/oqu6COTOE9ZRNKQXVkUFTxhCiWdiIs5OltS0tV+0ymm
	NKoK9/aN3MQd9eHB7xv7U7YYjZWnz49ExWXcsReU5dM6ahbrjYDifZsSL+NeBH2yvDDKQNVtFCD
	65nEAHDDr45oUNygNenIQo+jOuNhlu6Zxsv+ERLYQ9GxXcHyFccDPvysjb0ZZPeKg69721+6HKc
	IMWZJsWmqUYmjGNnoU6jt8lFULrLpdUoEJDzQ9bEvAg/L2l/7lbgnyLO0IbZ3Gt18o1qair1mNn
	7nAm+AmzeGJdjxlTp3AdjGuMWbrvxmVB1SPnI7/Gjnnrh9fpH9KZeEF+U9Z3omlfnIFKbOk6xrX
	+icvCOPN0L40z3fzhXS1pVErxRVOF7ALEfP6QIjr8=
X-Received: by 2002:a05:6000:4027:b0:439:b8b2:fad0 with SMTP id ffacd0b85a97d-439da555606mr9905810f8f.5.1772894649084;
        Sat, 07 Mar 2026 06:44:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm11931501f8f.26.2026.03.07.06.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 06:44:08 -0800 (PST)
Date: Sat, 7 Mar 2026 17:44:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rachit Dhar <rchtdhr@gmail.com>
Message-ID: <aaw5tQ6-QMJxXVIU@stanley.mountain>
References: <20260307140930.1732-1-rchtdhr@gmail.com>
 <20260307140930.1732-3-rchtdhr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260307140930.1732-3-rchtdhr@gmail.com>
X-Spamd-Bar: ---
Message-ID-Hash: UO7QSXEPNDLQKICM6TMGYTLGKJVTSPVK
X-Message-ID-Hash: UO7QSXEPNDLQKICM6TMGYTLGKJVTSPVK
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 2/2] staging: greybus: resolved checkpatch checks for light.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UO7QSXEPNDLQKICM6TMGYTLGKJVTSPVK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8F22922C3AD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.866];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,linaro.org:email,lists.linaro.org:rdns,lists.linaro.org:helo,checkpatch.pl:url]
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
> ---

This is a v4 so there should be a explanation of what changed since v3.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
