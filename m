Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 65823169B56
	for <lists+greybus-dev@lfdr.de>; Mon, 24 Feb 2020 01:46:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 976F46167C
	for <lists+greybus-dev@lfdr.de>; Mon, 24 Feb 2020 00:46:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 8D05B6197D; Mon, 24 Feb 2020 00:46:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9BDD860E15;
	Mon, 24 Feb 2020 00:46:16 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D842961932
 for <greybus-dev@lists.linaro.org>; Wed, 19 Feb 2020 19:57:03 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CAAC461945; Wed, 19 Feb 2020 19:57:03 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by lists.linaro.org (Postfix) with ESMTPS id E248561932
 for <greybus-dev@lists.linaro.org>; Wed, 19 Feb 2020 19:56:59 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id e8so498014plt.9
 for <greybus-dev@lists.linaro.org>; Wed, 19 Feb 2020 11:56:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=a7yW3eGud1nSB17w6PgcUOM+BLtId9z+DBtjQPe4XL0=;
 b=AtQQFqX7wo4NMTSF+eMaNCUL2sAcVSiPFylxCptiwjTQOeuW6xunp6azzUSCYXxhC/
 0Bhn3TQ2A/DbPZA3SE+n1KQRgQ8PANKmiUpYA4i8Z0w84nolUpi7+3r6QBO0f1SnaFf9
 qMRLjzwzQriFA7AgkATULXAhujhY449bYJvtGxoC1wxXg+YNprXdbUnRS3kvi7HuPTas
 +6P8+h7QPleA1yreYtaqjtt4zYuPhUCEAOzvlov8jBGXvCuPtGtPOjTyIVXuNuKL4HyC
 +Qh0CAAqfDpbuORKHBR0ZYNeRIBVQnRM+ldh0LYQVqi7eFdjIdQm1aDbnFsTrCpEddfP
 CYNQ==
X-Gm-Message-State: APjAAAW9+3prz5R4sa6Ssi+0Xg6Sf1DFoKn7rj0eL7xghtei0PvaVVRR
 qZRqyEEtSLkefqjQ62KBdWGzig==
X-Google-Smtp-Source: APXvYqxwuzVnh9ab7+j2hcebiGY8l+/eJsMFxnHM0mMZAQQEbpFy2cBwB1vsrtm/7WJQHXpNqIW4FA==
X-Received: by 2002:a17:90a:20aa:: with SMTP id
 f39mr10917261pjg.35.1582142218933; 
 Wed, 19 Feb 2020 11:56:58 -0800 (PST)
Received: from kaaira-HP-Pavilion-Notebook ([103.37.201.172])
 by smtp.gmail.com with ESMTPSA id t189sm422306pfd.168.2020.02.19.11.56.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Feb 2020 11:56:58 -0800 (PST)
Date: Thu, 20 Feb 2020 01:26:51 +0530
From: Kaaira Gupta <kgupta@es.iitr.ac.in>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
 Mark Greer <mgreer@animalcreek.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-kernel@vger.kernel.org
Message-ID: <20200219195651.GA485@kaaira-HP-Pavilion-Notebook>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 24 Feb 2020 00:46:14 +0000
Subject: [greybus-dev] [PATCH] staging: greybus: match parenthesis alignment
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

Rml4IGNoZWNrcGF0Y2gucGwgd2FybmluZyBvZiBhbGlnbm1lbnQgc2hvdWxkIG1hdGNoIG9wZW4g
cGFyZW50aGVzaXMgaW4KYXVkaW9fY29kZWMuYwoKU2lnbmVkLW9mZi1ieTogS2FhaXJhIEd1cHRh
IDxrZ3VwdGFAZXMuaWl0ci5hYy5pbj4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRp
b19jb2RlYy5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRp
b19jb2RlYy5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYwppbmRleCAw
ODc0NmM4NWRlYTYuLmQ2MmY5MWY0ZTlhMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvYXVkaW9fY29kZWMuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19j
b2RlYy5jCkBAIC03MCw3ICs3MCw3IEBAIHN0YXRpYyBpbnQgZ2JhdWRpb19tb2R1bGVfZW5hYmxl
X3R4KHN0cnVjdCBnYmF1ZGlvX2NvZGVjX2luZm8gKmNvZGVjLAogCQlpMnNfcG9ydCA9IDA7CS8q
IGZpeGVkIGZvciBub3cgKi8KIAkJY3BvcnRpZCA9IGRhdGEtPmNvbm5lY3Rpb24tPmhkX2Nwb3J0
X2lkOwogCQlyZXQgPSBnYl9hdWRpb19hcGJyaWRnZWFfcmVnaXN0ZXJfY3BvcnQoZGF0YS0+Y29u
bmVjdGlvbiwKLQkJCQkJCWkyc19wb3J0LCBjcG9ydGlkLAorCQkJCQkJCWkyc19wb3J0LCBjcG9y
dGlkLAogCQkJCQkJQVVESU9fQVBCUklER0VBX0RJUkVDVElPTl9UWCk7CiAJCWlmIChyZXQpIHsK
IAkJCWRldl9lcnJfcmF0ZWxpbWl0ZWQobW9kdWxlLT5kZXYsCkBAIC0xNjAsNyArMTYwLDcgQEAg
c3RhdGljIGludCBnYmF1ZGlvX21vZHVsZV9kaXNhYmxlX3R4KHN0cnVjdCBnYmF1ZGlvX21vZHVs
ZV9pbmZvICptb2R1bGUsIGludCBpZCkKIAkJaTJzX3BvcnQgPSAwOwkvKiBmaXhlZCBmb3Igbm93
ICovCiAJCWNwb3J0aWQgPSBkYXRhLT5jb25uZWN0aW9uLT5oZF9jcG9ydF9pZDsKIAkJcmV0ID0g
Z2JfYXVkaW9fYXBicmlkZ2VhX3VucmVnaXN0ZXJfY3BvcnQoZGF0YS0+Y29ubmVjdGlvbiwKLQkJ
CQkJCWkyc19wb3J0LCBjcG9ydGlkLAorCQkJCQkJCSAgaTJzX3BvcnQsIGNwb3J0aWQsCiAJCQkJ
CQlBVURJT19BUEJSSURHRUFfRElSRUNUSU9OX1RYKTsKIAkJaWYgKHJldCkgewogCQkJZGV2X2Vy
cl9yYXRlbGltaXRlZChtb2R1bGUtPmRldiwKQEAgLTIwNSw3ICsyMDUsNyBAQCBzdGF0aWMgaW50
IGdiYXVkaW9fbW9kdWxlX2VuYWJsZV9yeChzdHJ1Y3QgZ2JhdWRpb19jb2RlY19pbmZvICpjb2Rl
YywKIAkJaTJzX3BvcnQgPSAwOwkvKiBmaXhlZCBmb3Igbm93ICovCiAJCWNwb3J0aWQgPSBkYXRh
LT5jb25uZWN0aW9uLT5oZF9jcG9ydF9pZDsKIAkJcmV0ID0gZ2JfYXVkaW9fYXBicmlkZ2VhX3Jl
Z2lzdGVyX2Nwb3J0KGRhdGEtPmNvbm5lY3Rpb24sCi0JCQkJCQlpMnNfcG9ydCwgY3BvcnRpZCwK
KwkJCQkJCQlpMnNfcG9ydCwgY3BvcnRpZCwKIAkJCQkJCUFVRElPX0FQQlJJREdFQV9ESVJFQ1RJ
T05fUlgpOwogCQlpZiAocmV0KSB7CiAJCQlkZXZfZXJyX3JhdGVsaW1pdGVkKG1vZHVsZS0+ZGV2
LApAQCAtMjk1LDcgKzI5NSw3IEBAIHN0YXRpYyBpbnQgZ2JhdWRpb19tb2R1bGVfZGlzYWJsZV9y
eChzdHJ1Y3QgZ2JhdWRpb19tb2R1bGVfaW5mbyAqbW9kdWxlLCBpbnQgaWQpCiAJCWkyc19wb3J0
ID0gMDsJLyogZml4ZWQgZm9yIG5vdyAqLwogCQljcG9ydGlkID0gZGF0YS0+Y29ubmVjdGlvbi0+
aGRfY3BvcnRfaWQ7CiAJCXJldCA9IGdiX2F1ZGlvX2FwYnJpZGdlYV91bnJlZ2lzdGVyX2Nwb3J0
KGRhdGEtPmNvbm5lY3Rpb24sCi0JCQkJCQlpMnNfcG9ydCwgY3BvcnRpZCwKKwkJCQkJCQkgIGky
c19wb3J0LCBjcG9ydGlkLAogCQkJCQkJQVVESU9fQVBCUklER0VBX0RJUkVDVElPTl9SWCk7CiAJ
CWlmIChyZXQpIHsKIAkJCWRldl9lcnJfcmF0ZWxpbWl0ZWQobW9kdWxlLT5kZXYsCi0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXli
dXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8v
bGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
