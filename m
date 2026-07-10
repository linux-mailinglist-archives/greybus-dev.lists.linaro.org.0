Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kxZyDm/DUGrr4gIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jul 2026 12:03:27 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E47F7739696
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jul 2026 12:03:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="iQR/2tZL";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1074440D71
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jul 2026 10:03:26 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	by lists.linaro.org (Postfix) with ESMTPS id E9CA53FDB0
	for <greybus-dev@lists.linaro.org>; Fri, 10 Jul 2026 04:41:11 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381018b9375so727786a91.0
        for <greybus-dev@lists.linaro.org>; Thu, 09 Jul 2026 21:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783658471; x=1784263271; darn=lists.linaro.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=618XwBlkSXmaSNWDLp2getHPTEbLpmZi3PDA41qTTi8=;
        b=iQR/2tZLcviiTWCWxd4ACpL3UExBMbchP0nmRhtKw7fj7fGzH6x3i87U9+89Z9YmPP
         Ic0WnHqb+QnaMolx9BTwtdg2MFOjrrd59G+DGwjh4H43w/XCuINs2mHzL2gC225k/RvJ
         Xfu4S8ImkKXgUvGUXZHhmj2Ex3/EcEo8aC2vo5VjLrv2hCWC17acptVgT0Z1vVClVEdt
         q+ELbO3rcHD1CIISAOB/SEcLh+qxlnxbZaZTgvTIUKlYAXFWBgNtIpQcvUrvHe5C3tlt
         WEMubttF4TyCdFOziv7e1Yb9CRTOqL+FRVmuojSvij1NsL5pmH7zwp1Lot15VODuIKzs
         3zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783658471; x=1784263271;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=618XwBlkSXmaSNWDLp2getHPTEbLpmZi3PDA41qTTi8=;
        b=lgNlB5QN4PEtfVH5CMVwyuafLnVPRWqOKkiw7xIZY11Y50UE5wmKUjr4t3UK8y+msF
         J3q8ukupbrDgJCwoOU7Ep9WkHmNr0AdSTm7wkFm7wOWuoiIR6u2saVCEYCoSJkV0gZE0
         qA67CXdvSYnVVxfbsvYJAvCMzgZf3uzNd0+PfvzYoG5PVmZeV6O+2KWZJDZItoUQm5aO
         Y2cORcWEHc5ZoDmHgckDHqBehqnsC76tPfmdzz34ClGXbcNtt2b8Wbc+QNCPHDgxRtb7
         dQiX0qbzROAadk3GPVfFWunHBGFa3ZqVETJTeNzAEIsWlo6PR1fRNSQwV9Vahto3EpJR
         mBng==
X-Forwarded-Encrypted: i=1; AHgh+Rpk6oJ+AZz+tD6b84+pTSueT479IIettvuVGQgKkHQWS78stMLkx6pj646f/ukE5zM6NgoFDuMiTvOGIg==@lists.linaro.org
X-Gm-Message-State: AOJu0YymaI3Pw3nNgjfEa7u5+ilVaj2W5YGOPxCMiHS87DFQ1kRQTjFK
	Vvor+2aJePY45Idowb1F3ck8Ci0p7tWmVZvJtjauzR+vkofFBAR2aGBO
X-Gm-Gg: AfdE7cmzaQninsPErK92eAfwnlGSXF9t3D80ht39HiTbCRw0UyjIuN09aXBH4u16dPB
	KuRjcUeEZfzXUNbAxLy7xwsAj0N25kLxpGoyqHcr1UjWuSQiUYCAnlyFdkjEa/HvlOXUYXJyk7m
	CqiiPgGP9A8S84lX0MB21tXwUUD9lOYI1xzSj1Nvp09+73D+ztw1eozX/MVgICTib0Te99QdhYM
	jb7WnScv0RhVxpv6FSJDqsKMDfFPLUmG6rXlYJpr5J3Y007DWMRX4Lp28PTfBiFnRDBHeAjCPo5
	aZ7c/lgFvECxGYdsuD9HmyqADGUeuXpxGhlh6acz0fJP7wv433HORXfNjul2QQUp+VuolSXsH4q
	VWMkNmz4ZSi7vZ/uMi1aV5FCDEtaH8Ikxrn2LFpUPN+O/jD8y09vPBT0I3A9xmgtMO1u4MT5CFG
	NAuhhJBBZt/uEjBknpGKib5+4=
X-Received: by 2002:a17:90b:5703:b0:381:21ea:9147 with SMTP id 98e67ed59e1d1-38940924754mr10622856a91.13.1783658470929;
        Thu, 09 Jul 2026 21:41:10 -0700 (PDT)
Received: from reply2_full.eml ([49.216.173.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516ad85sm2119312a91.2.2026.07.09.21.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 21:41:10 -0700 (PDT)
Message-ID: <20260710124050.31335.alvinhuang0603@gmail.com>
Date: Fri, 10 Jul 2026 12:40:50 +0800
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Dan Carpenter <error27@gmail.com>
In-Reply-To: <ak_tgJC8-d1HPKuV@stanley.mountain>
References: <20260704081613.434445-1-alvinhuang0603@gmail.com>
 <ak99bENMWC8saJL4@stanley.mountain>
 <20260710020644.6728.alvinhuang0603@gmail.com>
 <ak_tgJC8-d1HPKuV@stanley.mountain>
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: alvinhuang0603@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7EYOGFBNKFKZKILQ27LDE3DZ3NIVLQ5R
X-Message-ID-Hash: 7EYOGFBNKFKZKILQ27LDE3DZ3NIVLQ5R
X-Mailman-Approved-At: Fri, 10 Jul 2026 10:03:14 +0000
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: hid: fix SET_REPORT return value
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7EYOGFBNKFKZKILQ27LDE3DZ3NIVLQ5R/>
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
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:vireshk@kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alvinhuang0603@gmail.com,greybus-dev-bounces@lists.linaro.org];
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
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:from_smtp,lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E47F7739696

On Jul 10, 2026 at 2:50 AM, Dan Carpenter <error27@gmail.com> wrote:
> The bug is not hard to understand, the issue is that this changes the
> function completely...  Was nothing checking the return before?

It gets checked.  The value flows unchanged through __hid_hw_raw_request()
to the callers, and they look at it two ways:

 - hidraw returns it straight to userspace (write(), HIDIOCSFEATURE),
   where it is the number of bytes transferred.

 - in-kernel SET_REPORT callers, some testing "ret < 0" (hid-multitouch,
   hid-sony), some testing "ret != size" (hid-gt683r, hid-lenovo,
   hid-razer).

So the old return 0 was wrong both ways: the first group had a failed
SET_REPORT masked as success, and the second saw every SET_REPORT as a
failure.  Returning the count or a negative errno is what GET already
does in this driver and what usbhid/i2c-hid/uhid return, so nothing
working with those relied on the 0.

Thanks,
Hao-Qun
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
