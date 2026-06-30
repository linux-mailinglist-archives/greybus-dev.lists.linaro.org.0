Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kRa/JBHJQ2puhwoAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Jun 2026 15:48:01 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 544FC6E505C
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Jun 2026 15:48:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=Pcp3Yufo;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 65FFE40D29
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Jun 2026 13:48:00 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	by lists.linaro.org (Postfix) with ESMTPS id CDEA440AA9
	for <greybus-dev@lists.linaro.org>; Tue, 30 Jun 2026 12:17:08 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e9d7464b71so722243a34.0
        for <greybus-dev@lists.linaro.org>; Tue, 30 Jun 2026 05:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782821828; x=1783426628; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7cHes77q8EhrtBA+B/LAION1oySZSYHvNSe2t5fjkq4=;
        b=Pcp3Yufo42R5I2zrUbVn+S52Ss0EVxT+VV6H1ljmtwKscodYII2BlWUYIPS3JCg0QF
         id7qQ8vvmsBFeQi9bV9z0ji2x22aFcbNeyDhdWKL7ufSEPKbbxmH+FOGCnNlHV5Waxv1
         /BKFxrYpt+fadIOZL8n4zOpLnNUsZC2DcZt6bq3/mXpYzhDEwuNu7eYuDNgABLOVtoQl
         1RblQRipdXf6OKkr7lU+HEldEgsF6D+5w2yySBVhWZeuJQ899KlekSKmzccRVeCPoE4u
         Pt1b4mIhczz35c6ADHHfMyQryTDHcrItDg9oTQ8uiZvDn9xV4wiMy8GUO/btYdRMLbKk
         srpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782821828; x=1783426628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cHes77q8EhrtBA+B/LAION1oySZSYHvNSe2t5fjkq4=;
        b=QcHa7ie7j6fEmnu1CX5BZgrXqRntezjOgOubmWC20fPkaFumc1b2TeWBxjkz3SXdby
         UthVNg69I2Tw3IwuYkVzLlFT56nAPLjTFPgPxOTkKEFq9NVLDzE0YKMsVd5pndfdH8vH
         BUv227y7vDe+jpw9+5H8xAD4khdCsK+yYFywGzPFq4LWoWuEJKdMVBx14OGiNkIPfmp7
         nxiAQJ1oy4xC7lDkhhwTdTIOzG6oeL+f45PDkFB1CbOi5zdGoCuNefT4ZyVbBMCbbNYx
         VjUBXb+HTTHhAYWbK6e3xaDKak4h447v2k8Hh1ipo91acj3/U5rfQC/RQA6MgyaIWurq
         5LpA==
X-Forwarded-Encrypted: i=1; AFNElJ9vNKOrzaQjDOeaOLLXQ/RcceM6+MZWmqT9KUVKhMCiWqsdwtnG435r8+p4alTtN/JoV+/EFRUR1igF1A==@lists.linaro.org
X-Gm-Message-State: AOJu0YyUKTt5+6GrjLPoAZYHur7w1EYvMNqh3j/M0Z2+RWQPZpelnP/f
	Mdfu60KBVY/RnPHgpXMDJym+MEXEVWzfu6XaMbc+jy/NewvqDkvWrKDskPOjiqJC68k=
X-Gm-Gg: AfdE7clS/SreoNGJWwc03cs0qZLjsJZaZOSze+Muuwxc6oFE/eLUtCW9P4SNMyiUNR3
	PWWjwx07o145Ch2OEn2EOrAudC7RHh1n4Se4UUWNamQfRMNxAt06x0RV2zViCcYEFIE5WHbqLY0
	DBvm1B52cyzx5yBqSj8WI7yBYULg1WUN7dbreK6Kp1NuldKvZ01zVv5uQ6ssDnhfYk5VyTE5C3C
	i1p72Iog2o5Uu9ry+/eVEuZsVflHZGOYqHIF8EOj9kf8b53KufYx/WSls/evARVhe+6D3DSP8IS
	51FiKAdQz5sWKu5yvDK3Or8GftuQrvLfpcy+ERzEFd0PGDygyxD2Jz3KTY2BusP2wEurg0aqryD
	ljB1RblYmahHNV7cZvzZHONeVF0kDFXMGz+81AR3qphRn1F8oClUtAB+fvRxNeFHWtajF/rr89T
	lBUaKZsI2uJN0silJU
X-Received: by 2002:a05:6808:5296:b0:489:9724:1992 with SMTP id 5614622812f47-495eb006ee1mr2617762b6e.30.1782821828069;
        Tue, 30 Jun 2026 05:17:08 -0700 (PDT)
Received: from localhost ([74.80.182.100])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4935545dad9sm8287677b6e.16.2026.06.30.05.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 05:17:06 -0700 (PDT)
Date: Tue, 30 Jun 2026 15:16:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: adi25charis@gmail.com
Message-ID: <akOzu5aBoPgNvuoo@stanley.mountain>
References: <20260629144941.33818-1-adi25charis@gmail.com>
 <akOy6ORYkzHxodYU@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <akOy6ORYkzHxodYU@stanley.mountain>
X-Spamd-Bar: ----
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: LMTNTVF7WZFL5SXQQEMH3XKXYICQMMQE
X-Message-ID-Hash: LMTNTVF7WZFL5SXQQEMH3XKXYICQMMQE
X-Mailman-Approved-At: Tue, 30 Jun 2026 13:47:53 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: split topology get into size and data calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LMTNTVF7WZFL5SXQQEMH3XKXYICQMMQE/>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:adi25charis@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
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
X-Rspamd-Queue-Id: 544FC6E505C

On Tue, Jun 30, 2026 at 03:13:28PM +0300, Dan Carpenter wrote:
> On Mon, Jun 29, 2026 at 08:19:41PM +0530, adi25charis@gmail.com wrote:
> > +	topology = kzalloc(size, GFP_KERNEL);
> > +	if (!topology) {
> > +		ret = -ENOMEM;
> >  		goto disable_connection;
> >  	}
> >  
> > +	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology, size);
> 
> It's unfortunate that we don't save the size anywhere.  This code
> relies on trusting the firmware for its security.  It would be better
> to move away from that.
> 

(just ignore this comment.  It's just random thoughts, not related to
your patch.  Someone took some steps to try make this code less trusting
recently).

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
