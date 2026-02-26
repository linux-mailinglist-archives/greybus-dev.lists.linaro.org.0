Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGs+K5H9n2n3fAQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 09:00:17 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 543D91A22D2
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 09:00:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 372693F80A
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 08:00:16 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	by lists.linaro.org (Postfix) with ESMTPS id 707A43F7E4
	for <greybus-dev@lists.linaro.org>; Thu, 26 Feb 2026 08:00:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=aiypcgex;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.45 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48374014a77so5880145e9.3
        for <greybus-dev@lists.linaro.org>; Thu, 26 Feb 2026 00:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772092811; x=1772697611; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DhhLSJx/NkkogoubBZaHI7OfYKzmGyTd4xSdN54lguo=;
        b=aiypcgexOBtQzsvBSyK2IwBRVPTvumL8sZmGRfxRFpm4aTJmomabbXDvS2098rJ3jR
         dhTKFvAnMAnxcNUHfTqtd3qA3q9zZRImpzHdVtrFi3exNiIe7sSqDCLDSvGVNtJisYZj
         J0uvAti4h+DIOy0ryhsrk5PPLLFm2Z+N9Ix3/HNfYNqPxYb/Wue5BF/gyDtxmjdX7ELH
         IUE03mgXqTbqDL2Ls1fJ739GZwTbxJJIZcZfmRWQ133l+wL65DdJyb/BbOJx8KSXS8gJ
         XjXhBQVaHcsoG/MH9H0fnUSbs77Gmd+9aiGii3oY+voY+9TR86owA+FRwBUx5F/E9TM8
         o/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772092811; x=1772697611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhhLSJx/NkkogoubBZaHI7OfYKzmGyTd4xSdN54lguo=;
        b=IB3Q23aTeaC/ZeV2ivdnrhOw9rGtgu3lakN0ivbDRqxIzQ1Z+F9UzAMBHEB7ZqCFDR
         1QY2HmaRcUFGza2Ge1aUwq8SFnwIGtd1DqDYjSFMijHR8jkFTMo+7rgmlV/3880IUnut
         8Zi9LYLkT0eFAE41kFvNnyjwpFFqf1/yYgn3nvlfveawiLMb7vhWZ/W46KLXjJN/fXYh
         u0/Op5vtM+VI4ABnvDwXWpBk93rCwi+TycKh4gGBApeCWFho2sKfOXqgYREQrKtZFVXB
         CNTQJPAodEpjW69H5Lqx4MPJuAdp8GbwVn5dmG94Duiev5hN/oVQE9LRBka4HLymDgvy
         rmDw==
X-Forwarded-Encrypted: i=1; AJvYcCWmvv9k5QA/PE+bRLwlQ+Hh7xo7qn8X90FeTc/ZvVeXJuXOUh8WwblxqU2XuAD7boFs9C1D0yn8tCYndg==@lists.linaro.org
X-Gm-Message-State: AOJu0Yz4GJStL3ohX2Pim6HAs//wpzbTqWoWW4uWOZFsjLeyZHkJOa4B
	WGsdHsQ+wNcsVl7gsTI6My8f/awzV2aiP+6MSEJKRDYL0qdCHVBqQbWyFmLThFn4er+tbw==
X-Gm-Gg: ATEYQzw0r3/T+73w3fRz/DSfZexWX8kwlUwSk7yGsRF9Z+/oB+f7pzFX9Tfknou9Hzl
	f99b1LoDNyyYoWfqklQDmQ3RPhw60bqJ4msLhqdMrTGulEV8I5FNlfV6+1WgsPHcgOGaBbbVQ35
	Enox0w6Im8w1jwQUkh1gDs5L2wCXXLLArdjEKYEZMUD5+irfU0+YQubtGI5XP5AtlY8rfNEH2Zl
	89JuYejfYSZcd633W5slDuRJO+4TmBxppTBbxueVl7PP15MVaz2eNfoqLG6bAobfI31AbSpHqdv
	fRKBJuE0CKaBS5/grY1sZ7PxXnZsRPkRetuNCh1i0tGyzpxi3Lnmn5ccKE061gQI6c3j62ZyIWt
	Poo29K9/UGo+rk5zwV+C5kynSKuEJ+Qbfp6voUOrzbU0vT36coWOnxxzGQ/73qko4Biwoktarpj
	2/V2EebZItz8tiFm88s12j8Jxalr8B
X-Received: by 2002:a05:6000:310b:b0:437:66bf:a9d4 with SMTP id ffacd0b85a97d-4396f17cc72mr32819273f8f.37.1772092811208;
        Thu, 26 Feb 2026 00:00:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43992ced321sm7296891f8f.35.2026.02.26.00.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 00:00:10 -0800 (PST)
Date: Thu, 26 Feb 2026 11:00:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ruslan Valiyev <linuxoid@gmail.com>
Message-ID: <aZ_9h0TFQwg48amY@stanley.mountain>
References: <20260225212955.57102-1-linuxoid@gmail.com>
 <20260226074858.67635-1-linuxoid@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226074858.67635-1-linuxoid@gmail.com>
X-Spamd-Bar: ---
Message-ID-Hash: CJXSWGXW2YCPA6OMLK5JSGJZWZI5MFQP
X-Message-ID-Hash: CJXSWGXW2YCPA6OMLK5JSGJZWZI5MFQP
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: arche: use sysfs_emit() instead of sprintf()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CJXSWGXW2YCPA6OMLK5JSGJZWZI5MFQP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_SPAM(0.00)[0.999];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[linaro.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,linaro.org:email]
X-Rspamd-Queue-Id: 543D91A22D2
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 07:48:58AM +0000, Ruslan Valiyev wrote:
> Replace sprintf() with sysfs_emit() in state_show() sysfs attribute
> callbacks in arche-platform.c and arche-apb-ctrl.c.
> 
> Checkpatch complains about code using sprintf(). This code here is
> obviously safe as-is, but it would be more appropriate to use
> sysfs_emit().
> 
> Signed-off-by: Ruslan Valiyev <linuxoid@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
