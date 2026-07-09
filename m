Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9YjHAWfDUGrl4gIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jul 2026 12:03:19 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E177739676
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jul 2026 12:03:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=o8ChBTh4;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 443D940A44
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jul 2026 10:03:17 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	by lists.linaro.org (Postfix) with ESMTPS id 4C46D3FDB0
	for <greybus-dev@lists.linaro.org>; Thu,  9 Jul 2026 18:07:15 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-380cda7f00cso226620a91.0
        for <greybus-dev@lists.linaro.org>; Thu, 09 Jul 2026 11:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783620434; x=1784225234; darn=lists.linaro.org;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuKvNdMtfPuGOqhShdOewBpMLJ6Se1itd0me42XQ/vg=;
        b=o8ChBTh4zeKJ6QEuRecMRnhfv7gD2IfdP8RI/1Mi+k3tEgcbb0FqKJYfLvVrvO2H16
         F++xLa9X7H2q8EhZhva1SbA4Yc14dL3z+hlyWpMW5OMfVDlnGE9pja1D+MZOMY0CwjQ5
         EWKjpKigOTroM0ltP+FFXrdgGHf7LwG3+/3JZRCgsm2SRjcH43TWMLd3ATRMQ4Ky0Z71
         zpyajnattV9jyCuCggQrkjy/RP3lZudhuJwP+EluSK3CSn35yhkOztaz0zP2SHRADce5
         AriWQaWKarjQlojJ5om2Ag+IWkK3n1tCm99nCLymcfPpKE3u7lCwjlgFBaF7fttRlVWP
         KaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783620434; x=1784225234;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuKvNdMtfPuGOqhShdOewBpMLJ6Se1itd0me42XQ/vg=;
        b=B/3sLQPrYBIrU4C43VKqTVqG4NxPRyq6+IZzNJAVSOwGnxxHQusUTTlBDnJ7MtXOO/
         HuRKUb/tn6dwxHkGvuBSzmn8AgZ5RMSmIHH6wygCp8eoF9ZRdQuoxUX18H46qTb6QwU8
         mHvWs4grOMYWTrIHE3rRn1powl/5ymnM5spetJSmWut6xeCi6mOzgxFSkGseoM9oVVzl
         PH8FRSXWIPO24HWnjKKIOSZtl6kl2llqcavaOp/Pb4FW2tYFcx9JwjJOFJjXOJWnixeF
         1yLL0adcTqrnVhsP74G67gpSsoMnIsPxevWm176odO01g/D5gONkYNr+ZluYFmde9IPe
         cULw==
X-Forwarded-Encrypted: i=1; AHgh+Rpq2C//AR+D7QMnEnwQ7jd1ZYRX45c7ea7oulpTuFauR4LkFKqFOg9HNkV9fY22gxgh/irHPP5LSym+WA==@lists.linaro.org
X-Gm-Message-State: AOJu0YxwqoaRa+hmBPBUmt0aWSQ2b4K/L1BJK5tarLqqtPcM/L8wx6nO
	DVcjsEHAGkDZeT8QulXii0ldVfKFP0Nb8sWFgXsLPLBywSjsMMUTjfoM
X-Gm-Gg: AfdE7cnNuGvc34Czugp4LhH//vYVigNKXVKgG3h9Oh8cWbKPv+lndlnpZ45ERvj5105
	zufHYFZ4mPnTWs7Ibx8QBqbtEzGLVX1TFzarkWog/TDvQ2XzT2ctn9mWXT7fx2N8pduqAkZmpqX
	wu8QOWHwouFAFUFq+3SYG6I9K41t42kTKZZJVU/C83S1e7bPF6ITdtReay2BnIqEARtOvmO2nPp
	xtcdSJ+GnyeHljFt5Hy+VYE0OQBwFBaV0aFbEqWi/GlSAXqo7+H/OVxynroqYGUn9HFpjPOpWYa
	mJBz6IVVaV0DyOqvKZAE+udGEU06E7Xpu14S2hJncn0Nf/a+qFKnSQx9Gb+Pn8Ktc/Zqi51eiig
	zwSC0JhLa71TPxUYAE7CZqrKuEvP/icpFpQheYsJDG0aOLqQdDhEMEae7izmMoe49+s6fkJuF9f
	paw0NSGBzUMSssODvi1gp7nQ==
X-Received: by 2002:a17:90b:3d87:b0:382:3dcc:1487 with SMTP id 98e67ed59e1d1-389417e521emr8243228a91.25.1783620434200;
        Thu, 09 Jul 2026 11:07:14 -0700 (PDT)
Received: from reply_full.eml ([49.216.173.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a57dc46f4sm1618505a91.11.2026.07.09.11.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:07:13 -0700 (PDT)
Message-ID: <20260710020644.6728.alvinhuang0603@gmail.com>
Date: Fri, 10 Jul 2026 02:06:44 +0800
MIME-Version: 1.0
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Dan Carpenter <error27@gmail.com>
In-Reply-To: <ak99bENMWC8saJL4@stanley.mountain>
References: <20260704081613.434445-1-alvinhuang0603@gmail.com>
 <ak99bENMWC8saJL4@stanley.mountain>
X-Spamd-Bar: ---
X-MailFrom: alvinhuang0603@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZYIMF7CNDFO4WKAQ7JX2QAKRJ5GPAQE7
X-Message-ID-Hash: ZYIMF7CNDFO4WKAQ7JX2QAKRJ5GPAQE7
X-Mailman-Approved-At: Fri, 10 Jul 2026 10:03:14 +0000
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: hid: fix SET_REPORT return value
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZYIMF7CNDFO4WKAQ7JX2QAKRJ5GPAQE7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:vireshk@kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alvinhuang0603@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alvinhuang0603@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:from_smtp,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E177739676

On Jul 9, 2026 at 6:52 PM, Dan Carpenter <error27@gmail.com> wrote:
> These kinds of changes require testing.  How have you tested this
> change?

I compile-tested it (W=1, building gb-hid, greybus and hid together) and
traced the return path by hand.  I don't have Greybus HID hardware and
couldn't find a working emulator (gbsim has been dead since Ara), so I
haven't run it on a live device.

The bug is that gb_hid_set_report() returns -errno on failure and len on
success, and __gb_hid_output_raw_report() computes that into ret (even
adding one back for the report ID byte) and then returns 0, discarding
it.  So a successful hidraw write reports 0 bytes written and a failed
SET_REPORT looks like success.  The GET path next to it already returns
the count, as do usbhid, i2c-hid and uhid, so callers already handle a
positive return and greybus HID was the only one returning 0.

Thanks,
Hao-Qun
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
