Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NxK+FKi4T2o0nQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 09 Jul 2026 17:05:12 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC067329CD
	for <lists+greybus-dev@lfdr.de>; Thu, 09 Jul 2026 17:05:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=UUd1pVNX;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CAEF540C71
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jul 2026 15:05:10 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	by lists.linaro.org (Postfix) with ESMTPS id 4223E3F9A9
	for <greybus-dev@lists.linaro.org>; Thu,  9 Jul 2026 10:52:36 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7eb63dbd229so572774a34.1
        for <greybus-dev@lists.linaro.org>; Thu, 09 Jul 2026 03:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783594355; x=1784199155; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QG9Jt3raC9zxX2MSD3KhQhG4RBmV8v+5QIW1bbTsOTs=;
        b=UUd1pVNXn+tHPZqc9BB33wdxJVBwI47Xt909S83Tgu3ZvY083mLWnuPF121taZUuyG
         YWdQ9+ie7xogsWm0bYWhJoPjW1v+FS5n3laDeDfxYIOe2NzXc0nYhY8XAp4h9znS9tlC
         LhNB5ixdPAhW9LohYORsod+wLgnUieigmBwDQLrFbYFk87oqvUny7QvTFeboUYjW7O3Y
         09mqcgADi3MLgQenEUNoDu58tw5EuhpNYCgWu+Wm4gDGALMjZ9YiBoZNd+wtmh5c3pTO
         GLZmdT4qufWOo2H7e7n8arjQvsXTj1rwamd0MNstJmyZWVTHsrmNHJt4VFz/REGaUITV
         UcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783594355; x=1784199155;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QG9Jt3raC9zxX2MSD3KhQhG4RBmV8v+5QIW1bbTsOTs=;
        b=B4uXG9ePVVqJgx9duffPt+mJ/L5r+2VWcVqv+Q40FSl3MPnKMVy/P9dfbMYqkBc8Eg
         KkgiQzBqEG2jEejEfgZUQiXJ5SQiSaYwTnsRttZD9gRRvEnFChYGhpcMGUGdeqe7RXQB
         6xIosJ6PLXAXMbAsl3+cHvk9R1et+cc2yY8305hajTkhtWwRydA9K8KgSHTTLSIu4eoZ
         HbYNzRF7p3cKAyCYKywab8EB3v5Iu1VjiVKq7fiwT1An4SZJ1B80O9IwN8/pjg918LMj
         JHCzKuSKiUnP+yK206mGo6uVSb5vzR6IE1L99fS9XDzo5sZWmHiRTgZZX2Cr0gpgj+Wo
         waTg==
X-Forwarded-Encrypted: i=1; AFNElJ/tA4dG9+ByK9nHFxQ6OuNgPTNrCaUwe/0IVzBARQEhTxx1VXWgEHW3jOj7H0PEoPlkkU5YlTZTzGosmw==@lists.linaro.org
X-Gm-Message-State: AOJu0YwDe7TYnWkyRw4oFUvT0CJpZIvF25jvAW6wiPJ0I+F6/ge2QsqM
	Nl/6I/ssJJ9y1AjcVwub9MbrwFSGpuxyqXlvTx1yPQ/AUtxbhUHp7cD4
X-Gm-Gg: AfdE7clEF4a0J3IF5nOHDSeNp7zG/B/QKDMJ0OQ/vnyX2RaTO1LNgy9dHc3AhUGJS32
	Nqlehkf/sd6HdtDMBdxYhp6a2FEKIN8dxbyp7RJG8/5zjL2seuZRi/jxePg54n7ms9q/U3jUoLM
	R+Cm4CIxMXD8DgA9/JRy3oJ9suZeY8/SfqgTMe9RTK8p0saalhFa1x/zuRKpXrFNk9XCTAPY9zY
	+vOcfS5FbIrDS3pr8IwdDMuHtOGbSgYJebpcEYo5EeQJII38COjpSAGS5zOnXjIfnTMmcxoCGLw
	oTjgmlX/0KhdWkQ8rorta3CyO3exMyIWHMPqgSjWYY85krP6HEnjb1fJlm6akuVi1k3llBZdGVO
	FFuQMGwWpZwKnzBgC+UIShBCNo77vCjVA6q63bkfMF0Do2+wiSSNHtgsBQn4/bOi27rUemaO58W
	LxbkwF
X-Received: by 2002:a05:6820:1ca8:b0:6a3:68f8:69e5 with SMTP id 006d021491bc7-6a37d88343amr1884175eaf.13.1783594355599;
        Thu, 09 Jul 2026 03:52:35 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519124d07dsm1652855fac.2.2026.07.09.03.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:52:34 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:52:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hao-Qun Huang <alvinhuang0603@gmail.com>
Message-ID: <ak99bENMWC8saJL4@stanley.mountain>
References: <20260704081613.434445-1-alvinhuang0603@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260704081613.434445-1-alvinhuang0603@gmail.com>
X-Spamd-Bar: ----
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: VGSWOG3MJ5K65H5ASWJ2OMVCDLQ4CGNV
X-Message-ID-Hash: VGSWOG3MJ5K65H5ASWJ2OMVCDLQ4CGNV
X-Mailman-Approved-At: Thu, 09 Jul 2026 15:04:39 +0000
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: hid: fix SET_REPORT return value
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VGSWOG3MJ5K65H5ASWJ2OMVCDLQ4CGNV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alvinhuang0603@gmail.com,m:vireshk@kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AAC067329CD

On Sat, Jul 04, 2026 at 04:16:13PM +0800, Hao-Qun Huang wrote:
> __gb_hid_output_raw_report() stores the result of gb_hid_set_report()
> in ret and even adjusts it to account for the report ID byte, but then
> always returns 0.
> 
> This hides Greybus transport errors from HID_REQ_SET_REPORT callers,
> and makes hidraw report zero bytes written to user space on success,
> although hid_hw_raw_request() is expected to return the number of
> bytes transferred or a negative errno. The sibling GET_REPORT path,
> __gb_hid_get_raw_report(), already follows this convention.
> 
> Return ret like the other HID transport drivers do.
> 
> Fixes: 96eab779e198 ("greybus: hid: add HID class driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
> ---

These kinds of changes require testing.  How have you tested this
change?

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
